<?php
    require('session.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Check In / Check Out';

    
    $page_access = $api->check_role_permissions($username, 111);
    $check_in_check_out = $api->check_role_permissions($username, 112);
    
    $check_user_account_status = $api->check_user_account_status($username);

    if($check_user_account_status){
        if($page_access == 0){
            header('location: 404-page.php');
        }

        $employee_details = $api->get_employee_details($username);
        $file_as = $employee_details[0]['FILE_AS'] ?? $username;
        $job_position = $employee_details[0]['JOB_POSITION'];
        $employee_image = $employee_details[0]['EMPLOYEE_IMAGE'] ?? null;

        $job_position_details = $api->get_job_position_details($job_position);
        $job_position_name = $job_position_details[0]['JOB_POSITION'] ?? null;

        if(empty($employee_image)){
            $employee_image = $api->check_image($employee_image, 'profile');
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
        <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
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
                            <div class="col-md-4">
                                <div class="card overflow-hidden">
                                    <div class="bg-primary">
                                        <div class="row">
                                            <div class="col-12 p-4"></div>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0"> 
                                        <div class="auth-logo">
                                            <a href="index.html" class="auth-logo-dark">
                                                <div class="avatar-md profile-user-wid mb-4">
                                                    <span class="avatar-title rounded-circle bg-light">
                                                        <img src="<?php echo $employee_image; ?>" alt="" class="rounded-circle" height="60">
                                                    </span>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="p-2">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="mb-4">
                                                        <h4 class="text-center"><?php echo $file_as; ?></h4>
                                                        <h5 class="text-center"><?php echo $job_position_name; ?></h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="mb-4 text-center">
                                                        <p class="text-muted text-truncate mb-2">Check In</p>
                                                        <h5 class="mb-0">32</h5>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="mb-4 text-center">
                                                        <p class="text-muted text-truncate mb-2">Check Out</p>
                                                        <h5 class="mb-0">10k</h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 text-center">
                                                    <div class="mb-4">
                                                        <button type="button" class="btn btn-success waves-effect waves-light w-lg">
                                                            <i class="bx bx-log-in d-block font-size-16 mb-1"></i> Check In
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 text-center">
                                                    <h5 class="text-center text-muted">Click to check in</h5>
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
        <script src="assets/libs/select2/js/select2.min.js"></script>
        <script src="assets/js/system.js?v=<?php echo rand(); ?>"></script>
        <script src="assets/js/pages/attendance-setting.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>