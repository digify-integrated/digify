<?php
    require('session.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'Employee';

    $page_access = $api->check_role_permissions($username, 90);
    $add_employee = $api->check_role_permissions($username, 91);
	$delete_employee = $api->check_role_permissions($username, 93);
	$archive_employee = $api->check_role_permissions($username, 94);
	$unarchive_employee = $api->check_role_permissions($username, 95);
    
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
        <link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css">
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
                                                        <h4 class="card-title">Employee List</h4>
                                                    </div>
                                                    <div class="d-flex gap-2">
                                                        <?php
                                                            if($add_employee > 0){
                                                                echo '<button type="button" class="btn btn-primary waves-effect btn-label waves-light" id="add-employee"><i class="bx bx-plus label-icon"></i> Add</button>';
                                                            }

                                                            if($delete_employee > 0){
                                                                echo '<button type="button" class="btn btn-danger waves-effect btn-label waves-light d-none multiple" id="delete-employee"><i class="bx bx-trash label-icon"></i> Delete</button>';
                                                            } 

                                                            if($unarchive_employee > 0){
                                                                echo '<button type="button" class="btn btn-success waves-effect btn-label waves-light d-none multiple-unarchive" id="unarchive-employee"><i class="bx bx-archive-out label-icon"></i> Unarchive</button>';
                                                            }

                                                            if($archive_employee > 0){
                                                                echo '<button type="button" class="btn btn-danger waves-effect btn-label waves-light d-none multiple-archive" id="archive-employee"><i class="bx bx-archive-in label-icon"></i> Archive</button>';
                                                            }
                                                        ?>

                                                        <button type="button" class="btn btn-info waves-effect btn-label waves-light" data-bs-toggle="offcanvas" data-bs-target="#filter-off-canvas" aria-controls="filter-off-canvas"><i class="bx bx-filter-alt label-icon"></i> Filter</button>
                                                    </div>
                                                </div>

                                                <div class="offcanvas offcanvas-end" tabindex="-1" id="filter-off-canvas" data-bs-backdrop="true" aria-labelledby="filter-off-canvas-label">
                                                        <div class="offcanvas-header">
                                                            <h5 class="offcanvas-title" id="filter-off-canvas-label">Filter</h5>
                                                            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                                        </div>
                                                        <div class="offcanvas-body">
                                                            <div class="mb-3">
                                                                <p class="text-muted">Employee Status</p>

                                                                <select class="form-control filter-select2" id="filter_employee_status">
                                                                    <option value="">All Employee Status</option>
                                                                    <option value="ARCHIVED">Archived</option>
                                                                    <option value="ACTIVE" selected>Active</option>
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <p class="text-muted">Work Location</p>

                                                                <select class="form-control filter-select2" id="filter_work_location">
                                                                    <option value="">All Work Location</option>
                                                                    <?php echo $api->generate_work_location_options(); ?>
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <p class="text-muted">Department</p>

                                                                <select class="form-control filter-select2" id="filter_department">
                                                                    <option value="">All Department</option>
                                                                    <?php echo $api->generate_department_options(); ?>
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <p class="text-muted">Job Position</p>

                                                                <select class="form-control filter-select2" id="filter_job_position">
                                                                    <option value="">All Job Position</option>
                                                                    <?php echo $api->generate_job_position_options(); ?>
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <p class="text-muted">Employee Type</p>

                                                                <select class="form-control filter-select2" id="filter_employee_type">
                                                                    <option value="">All Employee Type</option>
                                                                    <?php echo $api->generate_employee_type_options(); ?>
                                                                </select>
                                                            </div>
                                                            <div>
                                                                <button type="button" class="btn btn-primary waves-effect waves-light" id="apply-filter" data-bs-toggle="offcanvas" data-bs-target="#filter-off-canvas" aria-controls="filter-off-canvas">Apply Filter</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col-md-12">
                                                <table id="employee-datatable" class="table table-bordered align-middle mb-0 table-hover table-striped dt-responsive nowrap w-100">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                                                                </div>
                                                            </th>
                                                            <th class="all">#</th>
                                                            <th class="all">Employee</th>
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
        <script src="assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="assets/js/system.js?v=<?php echo rand(); ?>"></script>
        <script src="assets/js/pages/employee.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>