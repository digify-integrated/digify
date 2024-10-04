<?php
session_start();

require_once '../../../../components/configurations/config.php';
require_once '../../../../components/model/database-model.php';
require_once '../../../../components/model/security-model.php';
require_once '../../../../components/model/system-model.php';
require_once '../../authentication/model/authentication-model.php';
require_once '../../security-setting/model/security-setting-model.php';
require_once '../../app-module/model/app-module-model.php';
require_once '../../menu-item/model/menu-item-model.php';

require_once '../../../../assets/libs/PhpSpreadsheet/autoload.php';

$controller = new MenuGroupController(new MenuGroupModel(new DatabaseModel), new AuthenticationModel(new DatabaseModel, new SecurityModel), new AppModuleModel(new DatabaseModel), new SecurityModel(), new SystemModel());
$controller->handleRequest();

# -------------------------------------------------------------
class MenuGroupController {
    private $menuItemModel;
    private $appModuleModel;
    private $authenticationModel;
    private $securityModel;
    private $systemModel;

    # -------------------------------------------------------------
    public function __construct(MenuGroupModel $menuItemModel, AuthenticationModel $authenticationModel, AppModuleModel $appModuleModel, SecurityModel $securityModel, SystemModel $systemModel) {
        $this->menuItemModel = $menuItemModel;
        $this->appModuleModel = $appModuleModel;
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
                case 'add menu group':
                    $this->addMenuGroup();
                    break;
                case 'update menu group':
                    $this->updateMenuGroup();
                    break;
                case 'update app logo':
                    $this->updateAppLogo();
                    break;
                case 'get menu group details':
                    $this->getMenuGroupDetails();
                    break;
                case 'delete menu group':
                    $this->deleteMenuGroup();
                    break;
                case 'delete multiple menu group':
                    $this->deleteMultipleMenuGroup();
                    break;
                case 'export data':
                    $this->exportData();
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
    #   Add methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function addMenuGroup() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }

        $userID = $_SESSION['user_account_id'];
        $menuItemName = filter_input(INPUT_POST, 'menu_item_name', FILTER_SANITIZE_STRING);
        $appModuleID = filter_input(INPUT_POST, 'app_module_id', FILTER_VALIDATE_INT);
        $orderSequence = filter_input(INPUT_POST, 'order_sequence', FILTER_VALIDATE_INT);

        $appModuleDetails = $this->appModuleModel->getAppModule($appModuleID);
        $appModuleName = $appModuleDetails['app_module_name'] ?? '';
        
        $menuItemID = $this->menuItemModel->saveMenuGroup(null, $menuItemName, $appModuleID, $appModuleName, $orderSequence, $userID);
    
        $response = [
            'success' => true,
            'menuItemID' => $this->securityModel->encryptData($menuItemID),
            'title' => 'Save Menu Group',
            'message' => 'The menu group has been saved successfully.',
            'messageType' => 'success'
        ];
            
        echo json_encode($response);
        exit;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Update methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateMenuGroup() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }
        
        $userID = $_SESSION['user_account_id'];
        $menuItemID = filter_input(INPUT_POST, 'menu_item_id', FILTER_VALIDATE_INT);
        $menuItemName = filter_input(INPUT_POST, 'menu_item_name', FILTER_SANITIZE_STRING);
        $appModuleID = filter_input(INPUT_POST, 'app_module_id', FILTER_VALIDATE_INT);
        $orderSequence = filter_input(INPUT_POST, 'order_sequence', FILTER_VALIDATE_INT);
    
        $checkMenuGroupExist = $this->menuItemModel->checkMenuGroupExist($menuItemID);
        $total = $checkMenuGroupExist['total'] ?? 0;

        if($total === 0){
            $response = [
                'success' => false,
                'notExist' => true,
                'title' => 'Save Menu Group',
                'message' => 'The menu group does not exist.',
                'messageType' => 'error'
            ];
            
            echo json_encode($response);
            exit;
        }

        $appModuleDetails = $this->appModuleModel->getAppModule($appModuleID);
        $appModuleName = $appModuleDetails['app_module_name'] ?? '';

        $this->menuItemModel->saveMenuGroup($menuItemID, $menuItemName, $appModuleID, $appModuleName, $orderSequence, $userID);
            
        $response = [
            'success' => true,
            'title' => 'Save Menu Group',
            'message' => 'The menu group has been saved successfully.',
            'messageType' => 'success'
        ];
        
        echo json_encode($response);
        exit;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Delete methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function deleteMenuGroup() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }

        $menuItemID = filter_input(INPUT_POST, 'menu_item_id', FILTER_VALIDATE_INT);
        
        $checkMenuGroupExist = $this->menuItemModel->checkMenuGroupExist($menuItemID);
        $total = $checkMenuGroupExist['total'] ?? 0;

        if($total === 0){
            $response = [
                'success' => false,
                'notExist' => true,
                'title' => 'Delete Menu Group',
                'message' => 'The menu group does not exist.',
                'messageType' => 'error'
            ];
                
            echo json_encode($response);
            exit;
        }

        $this->menuItemModel->deleteMenuGroup($menuItemID);
                
        $response = [
            'success' => true,
            'title' => 'Delete Menu Group',
            'message' => 'The menu group has been deleted successfully.',
            'messageType' => 'success'
        ];
            
        echo json_encode($response);
        exit;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function deleteMultipleMenuGroup() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }

        if (isset($_POST['app_module_id']) && !empty($_POST['app_module_id'])) {
            $menuItemIDs = $_POST['app_module_id'];
    
            foreach($menuItemIDs as $menuItemID){
                $checkMenuGroupExist = $this->menuItemModel->checkMenuGroupExist($menuItemID);
                $total = $checkMenuGroupExist['total'] ?? 0;

                if($total > 0){
                    $this->menuItemModel->deleteMenuGroup($menuItemID);
                }
            }
                
            $response = [
                'success' => true,
                'title' => 'Delete Multiple Menu Group',
                'message' => 'The selected menu groups have been deleted successfully.',
                'messageType' => 'success'
            ];
            
            echo json_encode($response);
            exit;
        }
        else{
            $response = [
                'success' => false,
                'title' => 'Error: Transaction Failed',
                'message' => 'An error occurred while processing your transaction. Please try again or contact our support team for assistance.',
                'messageType' => 'error'
            ];
            
            echo json_encode($response);
            exit;
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Export methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function exportData() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }

        if (isset($_POST['export_to']) && !empty($_POST['export_to']) && isset($_POST['export_id']) && !empty($_POST['export_id']) && isset($_POST['table_column']) && !empty($_POST['table_column'])) {
            $exportTo = $_POST['export_to'];
            $exportIDs = $_POST['export_id']; 
            $tableColumns = $_POST['table_column'];
            
            if ($exportTo == 'csv') {
                $filename = "menu_item_export_" . date('Y-m-d_H-i-s') . ".csv";
            
                header('Content-Type: text/csv');
                header('Content-Disposition: attachment; filename="' . $filename . '"');
                
                $output = fopen('php://output', 'w');

                fputcsv($output, $tableColumns);
                
                $columns = implode(", ", $tableColumns);
                
                $ids = implode(",", array_map('intval', $exportIDs));
                $menuItemDetails = $this->menuItemModel->exportMenuGroup($columns, $ids);

                foreach ($menuItemDetails as $menuItemDetail) {
                    fputcsv($output, $menuItemDetail);
                }

                fclose($output);
                exit;
            }
            else {
                ob_start();
                $filename = "menu_item_export_" . date('Y-m-d_H-i-s') . ".xlsx";

                $spreadsheet = new Spreadsheet();
                $sheet = $spreadsheet->getActiveSheet();

                $colIndex = 'A';
                foreach ($tableColumns as $column) {
                    $sheet->setCellValue($colIndex . '1', ucfirst(str_replace('_', ' ', $column)));
                    $colIndex++;
                }

                $columns = implode(", ", $tableColumns);
                
                $ids = implode(",", array_map('intval', $exportIDs));
                $menuItemDetails = $this->menuItemModel->exportMenuGroup($columns, $ids);

                $rowNumber = 2;
                foreach ($menuItemDetails as $menuItemDetail) {
                    $colIndex = 'A';
                    foreach ($tableColumns as $column) {
                        $sheet->setCellValue($colIndex . $rowNumber, $menuItemDetail[$column]);
                        $colIndex++;
                    }
                    $rowNumber++;
                }

                ob_end_clean();

                header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
                header('Content-Disposition: attachment; filename="' . $filename . '"');
                header('Cache-Control: max-age=0');

                $writer = new Xlsx($spreadsheet);
                $writer->save('php://output');
                exit;
            }
        }
        else{
            $response = [
                'success' => false,
                'title' => 'Error: Transaction Failed',
                'message' => 'An error occurred while processing your transaction. Please try again or contact our support team for assistance.',
                'messageType' => 'error'
            ];
            
            echo json_encode($response);
            exit;
        }
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Get details methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function getMenuGroupDetails() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }
    
        $userID = $_SESSION['user_account_id'];
        $menuItemID = filter_input(INPUT_POST, 'menu_item_id', FILTER_VALIDATE_INT);

        $checkMenuGroupExist = $this->menuItemModel->checkMenuGroupExist($menuItemID);
        $total = $checkMenuGroupExist['total'] ?? 0;

        if($total === 0){
            $response = [
                'success' => false,
                'notExist' => true,
                'title' => 'Get Menu Group Details',
                'message' => 'The menu group does not exist.',
                'messageType' => 'error'
            ];
            
            echo json_encode($response);
            exit;
        }

        $menuItemDetails = $this->menuItemModel->getMenuGroup($menuItemID);

        $response = [
            'success' => true,
            'menuItemName' => $menuItemDetails['menu_item_name'] ?? null,
            'appModuleID' => $menuItemDetails['app_module_id'] ?? null,
            'appModuleName' => $menuItemDetails['app_module_name'] ?? null,
            'orderSequence' => $menuItemDetails['order_sequence'] ?? null
        ];

        echo json_encode($response);
        exit;
    }
    # -------------------------------------------------------------
}
# -------------------------------------------------------------

?>