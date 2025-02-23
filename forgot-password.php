<?php
    require_once './config/config.php'; 

    $pageTitle = APP_NAME . ' | Forgot Password';
    
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
                        <form class="form w-100" id="forgot-password-form" method="post" action="#">
                            <img src="./assets/images/logos/logo-dark.svg" class="mb-5" alt="Logo-Dark" />
                            <h2 class="mb-2 mt-4 fs-1 fw-bolder">Forgot Password?</h2>
                            <p class="text-gray-500 mb-5 fs-6">Please enter the email address associated with your account. We will send you a link to reset your password.</p>
                            <div class="mb-3">
                                <input type="email" class="form-control" id="email" name="email" autocomplete="off" placeholder="Email">
                            </div>
                            <div class="d-flex flex-wrap justify-content-center pb-lg-0">
                                <button id="forgot-password" type="submit" class="btn btn-primary me-4">Submit</button>
                                <a href="index.php" class="btn btn-light">Cancel</a>                                
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

    <script type="module" src="./assets/js/pages/forgot-password.js?v=<?php echo rand(); ?>"></script>
</body>
</html>