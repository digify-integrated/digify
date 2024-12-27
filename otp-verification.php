<?php
    require_once 'config/config.php';
    require_once 'autoload.php';

    use App\Models\Authentication;
    use App\Core\Security;

    $security = new Security();
    $authentication = new Authentication();

    $pageTitle = APP_NAME . ' | Password Reset';

    if (isset($_GET['id']) && !empty($_GET['id'])) {
        $userID = $security->decryptData($_GET['id']);
    
        $checkLoginCredentialsExist = $authentication->checkLoginCredentialsExist($userID, null);
        $total = $checkLoginCredentialsExist['total'] ?? 0;
 
        if($total > 0){
            $loginCredentialsDetails = $authentication->getLoginCredentials($userID, null);
            $emailObscure = $security->obscureEmail($loginCredentialsDetails['email'] ?? '');
        }
        else{
            header('location: ./app/Views/Errors/404.php');
            exit;
        }
    }
    else {
        header('Location: index.php');
        exit;
    }

    require_once './app/Views/Includes/session-check.php'; 
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php 
        require_once './app/Views/Includes/head-meta-tags.php'; 
        require_once './app/Views/Includes/head-stylesheet.php';
    ?>
</head>

<?php require_once './app/Views/Includes/theme-script.php'; ?>

<body id="kt_body" class="app-blank bgi-size-cover bgi-attachment-fixed bgi-position-center bgi-no-repeat" data-kt-app-page-loading-enabled="true" data-kt-app-page-loading="on">
    <?php require_once './app/Views/Includes/preloader.php'; ?>
    <div class="d-flex flex-column flex-root" id="kt_app_root" style="background-image: url('./assets/images/backgrounds/login-bg.jpg');">
        <div class="d-flex flex-column flex-column-fluid flex-lg-row align-items-center justify-content-center">
            <div class="d-flex flex-column-fluid flex-lg-row-auto justify-content-center justify-content-lg-end p-5">
                <div class="bg-body d-flex flex-column align-items-stretch flex-center rounded-4 w-md-600px p-10">
                    <div class="d-flex flex-center flex-column flex-column-fluid px-lg-5 pb-5">
                        <form class="form w-100" id="otp-form" method="post" action="#">
                            <img src="./assets/images/logos/logo-dark.svg" class="mb-5" alt="Logo-Dark" />
                            <h2 class="mb-2 mt-4 fs-1 fw-bolder">Two Step Verification</h2>
                            <p class="mb-8 fs-5">Enter the verification code we sent to </p>
                            <div class="fw-bold text-gray-900 fs-3 mb-8"><?php echo $emailObscure; ?></div>
                            <input type="hidden" id="user_account_id" name="user_account_id" value="<?php echo $userID; ?>">
                            <div class="mb-8">
                                <label class="form-label fw-semibold">Type your 6 digit security code</label>
                                <div class="d-flex align-items-center gap-2 gap-sm-3">
                                    <input type="text" class="form-control text-center otp-input" id="otp_code_1" name="otp_code_1" autocomplete="off" maxlength="1">
                                    <input type="text" class="form-control text-center otp-input" id="otp_code_2" name="otp_code_2" autocomplete="off" maxlength="1">
                                    <input type="text" class="form-control text-center otp-input" id="otp_code_3" name="otp_code_3" autocomplete="off" maxlength="1">
                                    <input type="text" class="form-control text-center otp-input" id="otp_code_4" name="otp_code_4" autocomplete="off" maxlength="1">
                                    <input type="text" class="form-control text-center otp-input" id="otp_code_5" name="otp_code_5" autocomplete="off" maxlength="1">
                                    <input type="text" class="form-control text-center otp-input" id="otp_code_6" name="otp_code_6" autocomplete="off" maxlength="1">
                                </div>
                            </div>

                            <div class="d-grid">
                                <button id="verify" type="submit" class="btn btn-primary">Verify</button>
                            </div>

                            <div class="d-flex align-items-center mt-4">
                                <p class="fs-12 mb-0 fw-medium">Didn't get the code?</p>
                                <a class="text-primary fw-semibold ms-2" id="resend-link" href="javascript:void(0)">Resend</a>
                                <span class="text-primary fw-semibold ms-2 d-none" id="countdown"></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php 
        require_once './app/Views/Includes/error-modal.php';
        require_once './app/Views/Includes/required-js.php';        
    ?>

    <script type="module" src="./assets/js/pages/otp-verification.js?v=<?php echo rand(); ?>"></script>
</body>
</html>