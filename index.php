<?php
    require('components/configurations/config.php');
    require('components/model/database-model.php');

    $databaseModel = new DatabaseModel();

    $pageTitle = 'Digify';

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
                                                    <h2 class="mb-2 mt-4 fs-7 fw-bolder">Welcome to <span class="text-primary">Digify</span></h2>
                                                    <p class="mb-9">Empowering Futures, Crafting Digital Excellence</p>
                                                    <form id="signin-form" method="post" action="#">
                                                        <div class="mb-3">
                                                            <label for="username" class="form-label">Username</label>
                                                            <input type="text" class="form-control" id="username" name="username" autocomplete="off">
                                                        </div>
                                                        <div class="mb-3">
                                                            <div class="d-flex align-items-center justify-content-between">
                                                                <label for="password" class="form-label">Password</label>
                                                                <a class="text-primary link-dark fs-2" href="forgot-password.php" tabindex="100">Forgot Password?</a>
                                                            </div>
                                                            <div class="input-group">
                                                                <input type="password" class="form-control" id="password" name="password">
                                                                <button class="btn btn-dark rounded-end d-flex align-items-center password-addon" type="button">
                                                                    <i class="ti ti-eye"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <button id="signin" type="submit" class="btn btn-dark w-100 py-8 mb-4 rounded-1">Login</button>
                                                        <div class="d-flex align-items-center">
                                                            <p class="fs-12 mb-0 fw-medium">Don’t have an account yet?</p>
                                                            <a class="text-primary fw-bolder ms-2" href="./main/authentication-register2.html">Sign Up Now</a>
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
        <?php require_once('components/view/_index_required_js.php'); ?>

        <script src="./apps/security/authentication/js/index.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>