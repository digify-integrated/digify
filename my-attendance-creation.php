<?php
    require('session.php');
    require('config/config.php');
    require('classes/api.php');

    $api = new Api;
    $page_title = 'My Attendance Creation';

    $page_access = $api->check_role_permissions($username, 129);
	$request_attendance_creation = $api->check_role_permissions($username, 130);
	$cancel_attendance_creation = $api->check_role_permissions($username, 132);
	$tag_attendance_creation_for_recommendation = $api->check_role_permissions($username, 133);
	$delete_attendance_creation = $api->check_role_permissions($username, 134);
    
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
                require('views/menu/_attendance_menu.php');
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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Attendance</a></li>
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
                                                        <h4 class="card-title">My Attendance Creation List</h4>
                                                    </div>
                                                    <div class="d-flex gap-2">
                                                    <?php
                                                        if($request_attendance_creation > 0){
                                                            echo '<button type="button" class="btn btn-primary waves-effect btn-label waves-light" id="request-attendance-creation"><i class="bx bx-plus label-icon"></i> Add</button>';
                                                        }

                                                        if($tag_attendance_creation_for_recommendation > 0){
                                                            echo '<button type="button" class="btn btn-success waves-effect btn-label waves-light d-none multiple-for-recommendation" id="for-recommend-attendance-creation"><i class="bx bx-check label-icon"></i> For Recommendation</button>';
                                                        }

                                                        if($cancel_attendance_creation > 0){
                                                            echo '<button type="button" class="btn btn-warning waves-effect btn-label waves-light d-none multiple-cancel" id="cancel-attendance-creation"><i class="bx bx-calendar-x label-icon"></i> Cancel</button>';
                                                        }

                                                        if($delete_attendance_creation > 0){
                                                            echo '<button type="button" class="btn btn-danger waves-effect btn-label waves-light d-none multiple" id="delete-attendance-creation"><i class="bx bx-trash label-icon"></i> Delete</button>';
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
                                                            <p class="text-muted">For Recommendation Date</p>

                                                            <div class="input-group mb-3" id="filter-for-recommendation-start-date-container">
                                                                <input type="text" class="form-control" id="filter_for_recommendation_start_date" name="filter_for_recommendation_start_date" autocomplete="off" data-date-format="m/dd/yyyy" data-date-container="#filter-for-recommendation-start-date-container" data-provide="datepicker" data-date-autoclose="true" data-date-orientation="right" placeholder="Start Date">
                                                                <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                            </div>

                                                            <div class="input-group" id="filter-for-recommendation-end-date-container">
                                                                <input type="text" class="form-control" id="filter_for_recommendation_end_date" name="filter_for_recommendation_end_date" autocomplete="off" data-date-format="m/dd/yyyy" data-date-container="#filter-for-recommendation-end-date-container" data-provide="datepicker" data-date-autoclose="true" data-date-orientation="right" placeholder="End Date">
                                                                <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <p class="text-muted">Recommendation Date</p>

                                                            <div class="input-group mb-3" id="filter-recommendation-start-date-container">
                                                                <input type="text" class="form-control" id="filter_recommendation_start_date" name="filter_recommendation_start_date" autocomplete="off" data-date-format="m/dd/yyyy" data-date-container="#filter-recommendation-start-date-container" data-provide="datepicker" data-date-autoclose="true" data-date-orientation="right" placeholder="Start Date">
                                                                <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                            </div>

                                                            <div class="input-group" id="filter-recommendation-end-date-container">
                                                                <input type="text" class="form-control" id="filter_recommendation_end_date" name="filter_recommendation_end_date" autocomplete="off" data-date-format="m/dd/yyyy" data-date-container="#filter-recommendation-end-date-container" data-provide="datepicker" data-date-autoclose="true" data-date-orientation="right" placeholder="End Date">
                                                                <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <p class="text-muted">Decision Date</p>

                                                            <div class="input-group mb-3" id="filter-decision-start-date-container">
                                                                <input type="text" class="form-control" id="filter_decision_start_date" name="filter_decision_start_date" autocomplete="off" data-date-format="m/dd/yyyy" data-date-container="#filter-decision-start-date-container" data-provide="datepicker" data-date-autoclose="true" data-date-orientation="right" placeholder="Start Date">
                                                                <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                            </div>

                                                            <div class="input-group" id="filter-decision-end-date-container">
                                                                <input type="text" class="form-control" id="filter_decision_end_date" name="filter_decision_end_date" autocomplete="off" data-date-format="m/dd/yyyy" data-date-container="#filter-decision-end-date-container" data-provide="datepicker" data-date-autoclose="true" data-date-orientation="right" placeholder="End Date">
                                                                <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <p class="text-muted">Status</p>

                                                            <select class="form-control filter-select2" id="filter_status">
                                                                <option value="">All Status</option>
                                                                <option value="PEN" selected>Pending</option>
                                                                <option value="FORREC">For Recommendation</option>
                                                                <option value="REC">Recommended</option>
                                                                <option value="APV">Approved</option>
                                                                <option value="REJ">Rejected</option>
                                                                <option value="CAN">Cancelled</option>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <p class="text-muted">Sanction</p>

                                                            <select class="form-control filter-select2" id="filter_sanction">
                                                                <option value="">All Sanction</option>
                                                                <option value="1">True</option>
                                                                <option value="0">False</option>
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
                                                <table id="my-attendance-creation-datatable" class="table table-bordered align-middle mb-0 table-hover table-striped dt-responsive nowrap w-100">
                                                    <thead>
                                                        <tr>
                                                            <th class="all">
                                                                <div class="form-check">
                                                                    <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                                                                </div>
                                                            </th>
                                                            <th class="all">Time In</th>
                                                            <th class="all">Time Out</th>
                                                            <th class="all">Status</th>
                                                            <th class="all">Sanction</th>
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
        <script src="assets/js/pages/my-attendance-creation.js?v=<?php echo rand(); ?>"></script>
    </body>
</html>