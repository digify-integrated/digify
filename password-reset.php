<?php
    require('components/configurations/config.php');
    require('apps/security/authentication/model/authentication-model.php');
    require('components/model/database-model.php');
    require('components/model/security-model.php');

    $databaseModel = new DatabaseModel();
    $securityModel = new SecurityModel();
    $authenticationModel = new AuthenticationModel($databaseModel, $systemModel);

    $pageTitle = 'Password Reset';

    if (isset($_GET['id']) && !empty($_GET['id']) && isset($_GET['token']) && !empty($_GET['token'])) {
        $id = $_GET['id'];
        $token = $_GET['token'];
        $userID = $securityModel->decryptData($id);
        $token = $securityModel->decryptData($token);

        $loginCredentialsDetails = $authenticationModel->getLoginCredentials($userID, null);
        $resetToken =  $securityModel->decryptData($loginCredentialsDetails['reset_token']);
        $resetTokenExpiryDate = $securityModel->decryptData($loginCredentialsDetails['reset_token_expiry_date']);

        if($token != $resetToken || strtotime(date('Y-m-d H:i:s')) > strtotime($resetTokenExpiryDate)){
            header('location: 404.php');
            exit;
        }
    }
    else{
        header('location: index.php');
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
                                                    <h2 class="mb-2 mt-4 fs-7 fw-bolder">Password <span class="text-primary">Reset</span></h2>
                                                    <p class="mb-9">Enter your new password.</p>
                                                    <form id="password-reset-form" method="post" action="#">
                                                        <input type="hidden" id="user_account_id" name="user_account_id" value="<?php echo $userID; ?>">
                                                        <div class="mb-3">
                                                            <label for="new_password" class="form-label">New Password</label>
                                                            <div class="input-group">
                                                                <input type="password" class="form-control" id="new_password" name="new_password">
                                                                <button class="btn btn-dark rounded-end d-flex align-items-center password-addon" type="button">
                                                                    <i class="ti ti-eye"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="confirm_password" class="form-label">Confirm Password</label>
                                                            <div class="input-group">
                                                                <input type="password" class="form-control" id="confirm_password" name="confirm_password">
                                                                <button class="btn btn-dark rounded-end d-flex align-items-center password-addon" type="button">
                                                                    <i class="ti ti-eye"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <button id="reset" type="submit" class="btn btn-dark w-100 py-8 rounded-1">Reset Password</button>
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

        <script src="./apps/security/authentication/js/password-reset.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>