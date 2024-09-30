<?php
    require('components/configurations/config.php');
    require('apps/security/authentication/model/authentication-model.php');
    require('components/model/database-model.php');
    require('components/model/security-model.php');

    $databaseModel = new DatabaseModel();
    $securityModel = new SecurityModel();
    $authenticationModel = new AuthenticationModel($databaseModel, $securityModel);

    $pageTitle = 'OTP Verification';

    if (isset($_GET['id']) && !empty($_GET['id'])) {
        $id = $_GET['id'];
        $userID = $securityModel->decryptData($id);
 
        $checkLoginCredentialsExist = $authenticationModel->checkLoginCredentialsExist($userID, null);
        $total = $checkLoginCredentialsExist['total'] ?? 0;
 
        if($total > 0){
            $loginCredentialsDetails = $authenticationModel->getLoginCredentials($userID, null);
            $emailObscure = $securityModel->obscureEmail($loginCredentialsDetails['email']);
        }
        else{
            header('location: 404.php');
            exit;
        }
    }
    else {
        header('location: 404.php');
        exit;
    }

    require('components/configurations/session-check.php');
?>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
    <head>
        <?php require_once('components/view/_head_meta_tags.php'); ?>
        <?php require_once('components/view/_head_stylesheet.php'); ?>
    </head>

    <body>
        <?php require_once('components/view/_preloader.php'); ?>

        <div id="main-wrapper">
            <div class="position-relative overflow-hidden auth-bg min-vh-100 w-100 d-flex align-items-center justify-content-center">
                <div class="d-flex align-items-center justify-content-center w-100">
                    <div class="row justify-content-center w-100 my-5 my-xl-0">
                        <div class="col-md-5 d-flex flex-column justify-content-center">
                            <div class="card mb-0 bg-body auth-login m-auto w-100">
                                <div class="row gx-0">
                                    <div class="col-xl-12">
                                        <div class="row justify-content-center py-4">
                                            <div class="col-lg-11">
                                                <div class="card-body">
                                                    <a href="index.php" class="text-nowrap logo-img d-block mb-3">
                                                        <img src="./assets/images/logos/logo-dark.svg" class="dark-logo" alt="Logo-Dark" />
                                                    </a>
                                                    <h2 class="mb-2 mt-4 fs-7 fw-bolder">Two Step <span class="text-primary">Verification</span></h2>
                                                    <p class="mb-9">We've sent a verification code to your email address. Please check your inbox and enter the code below.</p>
                                                    <h6 class="fw-bolder"><?php echo $emailObscure; ?></h6>
                                                    <form id="otp-form" method="post" action="#">
                                                        <input type="hidden" id="user_account_id" name="user_account_id" value="<?php echo $userID; ?>">
                                                        <div class="mb-3">
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
                                                        <button id="verify" type="submit" class="btn btn-dark w-100 py-8 rounded-1">Verify</button>
                                                        <div class="d-flex align-items-center mt-2">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="dark-transparent sidebartoggler"></div>

        <?php require_once('components/view/_error_modal.php'); ?>
        <?php require_once('components/view/_required_js.php'); ?>

        <script src="./assets/libs/max-length/bootstrap-maxlength.min.js"></script>
        <script src="./apps/security/authentication/js/otp-verification.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>