<?php
    require('session.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Kiosk Mode';

    
    $page_access = $api->check_role_permissions($username, 111);
    $time_in_time_out = $api->check_role_permissions($username, 112);
    
    $check_user_account_status = $api->check_user_account_status($username);

    if($check_user_account_status){
        if($page_access == 0){
            header('location: 404-page.php');
        }
    }
    else{
        header('location: logout.php?logout');
    }

    require('views/_interface_settings.php');
?>

<!doctype html>
<html lang="en">
    <head>
        <?php require('views/_head.php'); ?>
        <link rel="stylesheet" href="assets/libs/sweetalert2/sweetalert2.min.css">
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <?php require('views/_required_css.php'); ?>
    </head>

    <body data-topbar="dark" data-layout="horizontal" class="bg-primary bg-soft">

        <?php require('views/_preloader.php'); ?>

        <div id="layout-wrapper">

            <?php 
                require('views/_top_bar.php');
                require('views/menu/_attendance_menu.php');
            ?>

            <div class="main-content">
                <div class="page-content">
                    <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-lg-4 col-md-6 col-md-12 col-sm-12">
                                <div class="card overflow-hidden">
                                    <div class="bg-primary">
                                        <div class="row">
                                            <div class="col-12 p-4"></div>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0"> 
                                        <div class="row">
                                            <div class="col-12 d-flex flex-row justify-content-center">
                                                <div class="auth-logo">
                                                    <div class="avatar-md profile-user-wid mb-4">
                                                        <span class="avatar-title rounded-circle bg-light">
                                                            <img src="<?php echo $menu_icon; ?>" alt="" class="rounded-circle" height="60">
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="p-2">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="mb-4">
                                                        <h3 class="text-center">Kiosk Mode</h3>
                                                        <h5 class="text-center">To get started, click the button to scan your badge. </h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 text-center">
                                                    <div class="mb-4">
                                                        <div class="mb-4">
                                                            <button type="button" class="btn btn-success waves-effect waves-light w-lg" id="scan-badge">
                                                                <i class="bx bx-barcode d-block font-size-16 mb-1"></i> Scan Badge
                                                            </button>
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

                <?php require('views/_footer.php'); ?>
            </div>

        </div>

        <?php require('views/_script.php'); ?>
        <script src="assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="assets/libs/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <script src="assets/libs/gmaps/gmaps.min.js"></script>
        <script src="assets/libs/html5-qr-code/html5-qrcode.min.js"></script>
        <script src="assets/js/system.js?v=<?php echo rand(); ?>"></script>
        <script src="assets/js/pages/kiosk-mode.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>