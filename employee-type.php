<?php
    require('session.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Employee Type';

    $page_access = $api->check_role_permissions($username, 97);
    $add_employee_type = $api->check_role_permissions($username, 98);
	$delete_employee_type = $api->check_role_permissions($username, 100);
    
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
        <link href="assets/libs/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="assets/libs/sweetalert2/sweetalert2.min.css">
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <?php require('views/_required_css.php'); ?>
    </head>

    <body data-topbar="dark" data-layout="horizontal">

        <?php require('views/_preloader.php'); ?>

        <div id="layout-wrapper">

            <?php 
                require('views/_top_bar.php');
                require('views/menu/_employee_menu.php');
            ?>

            <div class="main-content">
                <div class="page-content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-sm-0 font-size-18"><?php echo $page_title; ?></h4>
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="apps.php">Apps</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Employees</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Configurations</a></li>
                                            <li class="breadcrumb-item active"><?php echo $page_title; ?></li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="d-flex align-items-start">
                                                    <div class="flex-grow-1 align-self-center">
                                                        <h4 class="card-title">Employee Type List</h4>
                                                    </div>
                                                    <?php
                                                        if($add_employee_type > 0 || $delete_employee_type > 0){

                                                            if($add_employee_type > 0){
                                                                $add = '<button type="button" class="btn btn-primary waves-effect btn-label waves-light" id="add-employee-type"><i class="bx bx-plus label-icon"></i> Add</button>';
                                                            }
                                                            else{
                                                                $add = '';
                                                            }

                                                            if($delete_employee_type > 0){
                                                                $delete = '<button type="button" class="btn btn-danger waves-effect btn-label waves-light d-none multiple" id="delete-employee-type"><i class="bx bx-trash label-icon"></i> Delete</button>';
                                                            }
                                                            else{
                                                                $delete = '';
                                                            }

                                                            echo '<div class="d-flex gap-2">
                                                                    '. $add .'
                                                                    '. $delete .'
                                                                </div>';
                                                        }
                                                    ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col-md-12">
                                                <table id="employee-type-datatable" class="table table-bordered align-middle mb-0 table-hover table-striped dt-responsive nowrap w-100">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                                                                </div>
                                                            </th>
                                                            <th class="all">Employee Type</th>
                                                            <th class="all">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody></tbody>
                                                </table>
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
        <script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
        <script src="assets/libs/jquery-validation/js/jquery.validate.min.js"></script>
        <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
        <script src="assets/libs/select2/js/select2.min.js"></script>
        <script src="assets/js/system.js?v=<?php echo rand(); ?>"></script>
        <script src="assets/js/pages/employee-type.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>