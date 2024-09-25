<?php
session_start();

# -------------------------------------------------------------
class AuthenticationController {
    private $authenticationModel;
    private $securitySettingModel;
    private $systemModel;
    private $securityModel;

    # -------------------------------------------------------------
    public function __construct(AuthenticationModel $authenticationModel, SecuritySettingModel $securitySettingModel, SystemModel $systemModel, SecurityModel $securityModel) {
        $this->authenticationModel = $authenticationModel;
        $this->securitySettingModel = $securitySettingModel;
        $this->systemModel = $systemModel;
        $this->securityModel = $securityModel;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function handleRequest(){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $transaction = filter_input(INPUT_POST, 'transaction', FILTER_SANITIZE_STRING);

            switch ($transaction) {
                case 'authenticate':
                    $this->authenticate();
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
    #   Authenticate methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function authenticate() {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            return;
        }
    
        $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
        $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);
        
        $checkLoginCredentialsExist = $this->authenticationModel->checkLoginCredentialsExist(null, $username);
        $total = $checkLoginCredentialsExist['total'] ?? 0;
    
        if ($total === 0) {
            $response = [
                'success' => false,
                'title' => 'Authentication Failed',
                'message' => 'Invalid credentials. Please check and try again.',
                'messageType' => 'error'
            ];
        
            echo json_encode($response);
            exit; 
        }

        $loginCredentialsDetails = $this->authenticationModel->getLoginCredentials(null, $username);
        $userAccountID = $loginCredentialsDetails['user_account_id'];
        $active = $this->securityModel->decryptData($loginCredentialsDetails['active']);
        $userPassword = $this->securityModel->decryptData($loginCredentialsDetails['password']);
        $locked = $this->securityModel->decryptData($loginCredentialsDetails['locked']);
        $failedLoginAttempts = $loginCredentialsDetails['failed_login_attempts'];
        $passwordExpiryDate = $this->securityModel->decryptData($loginCredentialsDetails['password_expiry_date']);
        $accountLockDuration = $loginCredentialsDetails['account_lock_duration'];
        $lastFailedLoginAttempt = $loginCredentialsDetails['last_failed_login_attempt'];
        $twoFactorAuth = $loginCredentialsDetails['two_factor_auth'];
        $encryptedUserID = $this->securityModel->encryptData($userAccountID);
    
        if ($password !== $userPassword) {
            $this->handleInvalidCredentials($userAccountID, $failedLoginAttempts);
            return;
        }
     
        if ($active === 'No') {
            $response = [
                'success' => false,
                'title' => 'Account Inactive',
                'message' => 'Your account is inactive. Please contact the administrator for assistance.',
                'messageType' => 'error'
            ];
        }
    
       if ($this->passwordHasExpired($passwordExpiryDate)) {
            $this->handlePasswordExpiration($userAccountID, $encryptedUserID);
            exit;
        }
    
        /*if ($locked === 'Yes') {
            $this->handleAccountLock($userAccountID, $accountLockDuration, $lastFailedLoginAttempt);
            exit;
        }
    
        $this->authenticationModel->updateLoginAttempt($userAccountID, 0, null);
    
        if ($twoFactorAuth === 'Yes') {
            $this->handleTwoFactorAuth($userAccountID, $encryptedUserID);
            exit;
        }

        $sessionToken = $this->generateToken(6, 6);
        $encryptedSessionToken = $this->securityModel->encryptData($sessionToken);

        $this->authenticationModel->updateLastConnection($userAccountID, $encryptedSessionToken, date('Y-m-d H:i:s'));

        $loginCredentialsDetails = $this->authenticationModel->getLoginCredentials($userAccountID, null);
        $linkedID = $loginCredentialsDetails['linked_id'] ?? null;
        $userType = $loginCredentialsDetails['user_type'] ?? null;
        
        $_SESSION['user_account_id'] = $userAccountID;
        $_SESSION['session_token'] = $sessionToken;
        $_SESSION['linked_id'] = $linkedID;
        $_SESSION['user_type'] = $userType;

        $response = [
            'success' => true,
            'redirectLink' => 'apps.php'
        ];
        
        echo json_encode($response);
        exit;*/
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Handle methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    private function handleInvalidCredentials($userAccountID, $failedAttempts) {
        $failedAttempts = $failedAttempts + 1;
        $lastFailedLogin = date('Y-m-d H:i:s');
    
        $this->authenticationModel->updateLoginAttempt($userAccountID, $failedAttempts, $lastFailedLogin);

        $securitySettingDetails = $this->securitySettingModel->getSecuritySetting(1);
        $maxFailedLoginAttempts = $securitySettingDetails['value'] ?? MAX_FAILED_LOGIN_ATTEMPTS;

        $userAccountLockDurationSettingDetails = $this->securitySettingModel->getSecuritySetting(8);
        $baseLockDuration = $userAccountLockDurationSettingDetails['value'] ?? BASE_USER_ACCOUNT_DURATION;

        if ($failedAttempts > $maxFailedLoginAttempts) {
            $lockDuration = pow(2, ($failedAttempts - $maxFailedLoginAttempts)) * $baseLockDuration;
            $this->authenticationModel->updateAccountLock($userAccountID, $this->securityModel->encryptData('Yes'), $lockDuration);

            $durationParts = $this->formatDuration($lockDuration);
            $lockMessage = count($durationParts) > 0 ? ' for ' . implode(', ', $durationParts) : '';
            
            $response = [
                'success' => false,
                'title' => 'Account Locked',
                'message' => 'Too many failed login attempts. Your account has been locked' . $lockMessage . '.',
                'messageType' => 'error'
            ];
        }
        else {
            $response = [
                'success' => false,
                'title' => 'Authentication Failed',
                'message' => 'Invalid credentials. Please check and try again', 
                'messageType' => 'error'
            ];
        }
            
        echo json_encode($response);
        exit;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    private function handlePasswordExpiration($userAccountID, $encryptedUserID) {
        $securitySettingDetails = $this->securitySettingModel->getSecuritySetting(3);
        $defaultForgotPasswordLink = $securitySettingDetails['value'] ?? DEFAULT_PASSWORD_RECOVERY_LINK;

        $resetPasswordTokenDurationDetails = $this->securitySettingModel->getSecuritySetting(6);
        $resetPasswordTokenDuration = $resetPasswordTokenDurationDetails['value'] ?? RESET_PASSWORD_TOKEN_DURATION;

        $resetToken = $this->generateToken();
        $encryptedResetToken = $this->securityModel->encryptData($resetToken);
        $encryptedUserAccountID = $this->securityModel->encryptData($userAccountID);
        $resetTokenExpiryDate = date('Y-m-d H:i:s', strtotime('+'. $resetPasswordTokenDuration .' minutes'));
    
        $this->authenticationModel->updateResetToken($userAccountID, $encryptedResetToken, $resetTokenExpiryDate);
    
        $response = [
            'success' => false,
            'passwordExpired' => true,
            'title' => 'Account Password Expired',
            'message' => 'Your password has expired. Please reset it to proceed.',
            'redirectLink' => $defaultForgotPasswordLink . $encryptedUserAccountID .'&token=' . $encryptedResetToken,
            'messageType' => 'error'
        ];
        
        echo json_encode($response);
        exit;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Format methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    private function formatDuration($lockDuration) {
        $durationParts = [];
        
        $timeUnits = [
            'year' => 31536000,
            'month' => 2592000,
            'day' => 86400,
            'hour' => 3600,
            'minute' => 60
        ];
        
        foreach ($timeUnits as $unit => $seconds) {
            if ($lockDuration >= $seconds) {
                $value = (int)($lockDuration / $seconds);
                $durationParts[] = $value . ' ' . $unit . ($value > 1 ? 's' : '');
                $lockDuration %= $seconds;
            }
        }
    
        return empty($durationParts) ? '0 minutes' : implode(', ', $durationParts);
    }    
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Generate methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function generateOTPToken($length = 6) {
        $minValue = 10 ** ($length - 1);
        $maxValue = (10 ** $length) - 1;

        return (string) random_int($minValue, $maxValue);
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function generateToken($minLength = 10, $maxLength = 12) {
        $length = random_int($minLength, $maxLength);
        $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

        $resetToken = '';
        for ($i = 0; $i < $length; $i++) {
            $resetToken .= $characters[random_int(0, strlen($characters) - 1)];
        }

        return $resetToken;
    }
    # -------------------------------------------------------------


}

require_once '../../../../components/configurations/config.php';
require_once '../../../../components/model/database-model.php';
require_once '../../../../components/model/security-model.php';
require_once '../../../../components/model/system-model.php';
require_once '../../authentication/model/authentication-model.php';
require_once '../../security-setting/model/security-setting-model.php';

$controller = new AuthenticationController(new AuthenticationModel(new DatabaseModel), new SecuritySettingModel(new DatabaseModel), new SystemModel(), new SecurityModel());
$controller->handleRequest();
?>