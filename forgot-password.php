<?php
    $pageTitle = 'Forgot Password';

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
                                                    <h2 class="mb-2 mt-4 fs-7 fw-bolder">Forgot <span class="text-primary">Password</span></h2>
                                                    <p class="mb-9">Please enter the email address associated with your account. We will send you a link to reset your password.</p>
                                                    <form id="forgot-password-form" method="post" action="#">
                                                        <div class="mb-3">
                                                            <label for="email" class="form-label">Email Address</label>
                                                            <input type="email" class="form-control" id="email" name="email" autocomplete="off">
                                                        </div>
                                                        <button id="forgot-password" type="submit" class="btn btn-dark w-100 py-8 mb-3 rounded-1">Forgot Password</button>
                                                        <a href="index.php" class="btn bg-primary-subtle text-primary w-100 py-8 rounded-1">Back to Login</a>
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

        <script src="./apps/security/authentication/js/forgot-password.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>