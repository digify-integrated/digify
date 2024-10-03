<?php
session_start();

require_once '../../components/configurations/config.php';
require_once '../../components/model/database-model.php';
require_once '../../components/model/security-model.php';
require_once '../../components/model/system-model.php';
require_once '../../components/model/import-model.php';
require_once '../../apps/security/authentication/model/authentication-model.php';

$controller = new ImportController(new ImportModel(new DatabaseModel), new AuthenticationModel(new DatabaseModel, new SecurityModel), new SecurityModel(), new SystemModel());
$controller->handleRequest();

# -------------------------------------------------------------
class ImportController {
    private $importModel;
    private $authenticationModel;
    private $securityModel;
    private $systemModel;

    # -------------------------------------------------------------
    public function __construct(ImportModel $importModel, AuthenticationModel $authenticationModel, SecurityModel $securityModel, SystemModel $systemModel) {
        $this->importModel = $importModel;
        $this->authenticationModel = $authenticationModel;
        $this->securityModel = $securityModel;
        $this->systemModel = $systemModel;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function handleRequest(){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $userID = $_SESSION['user_account_id'];
            $sessionToken = $_SESSION['session_token'];

            $checkLoginCredentialsExist = $this->authenticationModel->checkLoginCredentialsExist($userID, null);
            $total = $checkLoginCredentialsExist['total'] ?? 0;

            if ($total === 0) {
                $response = [
                    'success' => false,
                    'userNotExist' => true,
                    'title' => 'User Account Not Exist',
                    'message' => 'The user account specified does not exist. Please contact the administrator for assistance.',
                    'messageType' => 'error'
                ];
                
                echo json_encode($response);
                exit;
            }

            $loginCredentialsDetails = $this->authenticationModel->getLoginCredentials($userID, null);
            $active = $loginCredentialsDetails['active'];
            $locked = $loginCredentialsDetails['locked'];
            $multipleSession = $loginCredentialsDetails['multiple_session'];
            $sessionToken = $this->securityModel->decryptData($loginCredentialsDetails['session_token']);

            if ($active === 'No') {
                $response = [
                    'success' => false,
                    'userInactive' => true,
                    'title' => 'User Account Inactive',
                    'message' => 'Your account is currently inactive. Kindly reach out to the administrator for further assistance.',
                    'messageType' => 'error'
                ];
                
                echo json_encode($response);
                exit;
            }
        
            if ($locked === 'Yes') {
                $response = [
                    'success' => false,
                    'userLocked' => true,
                    'title' => 'User Account Locked',
                    'message' => 'Your account is currently locked. Kindly reach out to the administrator for assistance in unlocking it.',
                    'messageType' => 'error'
                ];
                
                echo json_encode($response);
                exit;
            }
            
            if ($sessionToken != $sessionToken && $multipleSession == 'No') {
                $response = [
                    'success' => false,
                    'sessionExpired' => true,
                    'title' => 'Session Expired',
                    'message' => 'Your session has expired. Please log in again to continue',
                    'messageType' => 'error'
                ];
                
                echo json_encode($response);
                exit;
            }

            $transaction = isset($_POST['transaction']) ? $_POST['transaction'] : null;

            switch ($transaction) {
                case 'import data preview':
                    $this->importDataPreview();
                    break;
                case 'import data':
                    $this->importData();
                    break;
                default:
                    $response = [
                        'success' => false,
                        'title' => 'Error: Transaction Failed',
                        'message' => 'We encountered an issue while processing your request. Please try again, and if the problem persists, reach out to our support team for assistance.',
                        'messageType' => 'error'
                    ];
                    
                    echo json_encode($response);
                    break;
            }
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Import methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function importDataPreview() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }
    
        if (isset($_FILES['import_file']) && $_FILES['import_file']['error'] === 0) {
            $fileExtension = pathinfo($_FILES['import_file']['name'], PATHINFO_EXTENSION);
    
            if (strtolower($fileExtension) !== 'csv') {
                echo json_encode(['error' => 'Please upload a valid CSV file.']);
                return;
            }
    
            $file = fopen($_FILES['import_file']['tmp_name'], 'r');
    
            if ($file !== false) {
                $headers = fgetcsv($file);
    
                $data = [];

                while (($row = fgetcsv($file)) !== false) {
                    $data[] = $row;
                }
    
                fclose($file);
    
                $html = '<thead><tr>';
                foreach ($headers as $header) {
                    $html .= '<th>' . htmlspecialchars($header) . '</th>';
                }
                $html .= '</tr></thead><tbody>';
    
                foreach ($data as $row) {
                    $html .= '<tr>';
                    foreach ($row as $cell) {
                        $html .= '<td>' . htmlspecialchars($cell) . '</td>';
                    }
                    $html .= '</tr>';
                }
    
                $html .= '</tbody>';
    
                $response = [
                    'success' => true,
                    'table' => $html
                ];
                
                echo json_encode($response);
            }
            else {
                $response = [
                    'success' => false,
                    'title' => 'Upload File',
                    'message' => 'Failed to open file.',
                    'messageType' => 'error'
                ];
                
                echo json_encode($response);
            }
        }else {
            $response = [
                'success' => false,
                'title' => 'Upload File',
                'message' => 'No file uploaded or there was an upload error.',
                'messageType' => 'error'
            ];
            
            echo json_encode($response);
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function importData() { 
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }
    
        if (isset($_FILES['import_file']) && $_FILES['import_file']['error'] === 0) {
            $importTableName = filter_input(INPUT_POST, 'import_table_name', FILTER_SANITIZE_STRING);
            $fileExtension = pathinfo($_FILES['import_file']['name'], PATHINFO_EXTENSION);
    
            if (strtolower($fileExtension) !== 'csv') {
                echo json_encode(['error' => 'Please upload a valid CSV file.']);
                return;
            }
    
            $file = fopen($_FILES['import_file']['tmp_name'], 'r');
    
            if ($file !== false) {
                $headers = fgetcsv($file);
    
                if (!$headers) {
                    echo json_encode(['error' => 'Invalid CSV file format.']);
                    return;
                }
    
                $data = [];
                while (($row = fgetcsv($file)) !== false) {
                    if (count($row) === count($headers)) {
                        $data[] = $row;
                    } else {
                        echo json_encode(['error' => 'Row does not match header column count.']);
                        fclose($file);
                        return;
                    }
                }
                fclose($file);
    
                $placeholders = implode(',', array_fill(0, count($headers), '?')); 
                $columns = implode(',', array_map(function($header) {
                    return "`" . addslashes($header) . "`";
                }, $headers));
    
                $updateFields = implode(',', array_map(function($header) {
                    return "`" . addslashes($header) . "` = VALUES(`" . addslashes($header) . "`)"; 
                }, $headers));
    
                $this->importModel->saveImport($importTableName, $columns, $placeholders, $updateFields, $data);
    
                $response = [
                    'success' => true,
                    'title' => 'Import Data',
                    'message' => 'The data has been imported successfully.',
                    'messageType' => 'success'
                ];
                echo json_encode($response);
            }
            else {
                echo json_encode([
                    'success' => false,
                    'title' => 'Import Data',
                    'message' => 'Failed to open file.',
                    'messageType' => 'error'
                ]);
            }
        }
    } 
    # -------------------------------------------------------------
}
# -------------------------------------------------------------

?>