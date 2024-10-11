<?php
    require('components/view/_required_php.php');   
    require('components/view/_page_details.php');
?>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical" data-boxed-layout="full">
<head>
    <?php require_once('components/view/_head_meta_tags.php'); ?>
    <?php require_once('components/view/_head_stylesheet.php'); ?>
    <link rel="stylesheet" href="./assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css" />
    <link rel="stylesheet" href="./assets/libs/datatables.net-bs5/css/responsive.dataTables.min.css" />
</head>
<body>
    <?php require_once('components/view/_preloader.php'); ?>
    <div id="main-wrapper">
        <?php require_once('components/view/_sidebar.php'); ?>
        <div class="page-wrapper">
            <?php require_once('components/view/_header.php'); ?>
            <div class="body-wrapper">
                <div class="container-fluid">
                    <?php 
                        require_once('components/view/_breadcrumbs.php'); 

                        if($newRecord){
                            require_once('apps/security/system-action/view/_system_action_new.php');
                        }
                        else if(!empty($detailID)){
                            require_once('apps/security/system-action/view/_system_action_details.php');
                        }
                        else if(isset($_GET['import']) && !empty($_GET['import'])){
                            require_once('components/view/_import.php');
                        }
                        else{
                            require_once('apps/security/system-action/view/_system_action.php');
                        }
                    ?>
                </div>
                <?php require_once('components/view/_customizer.php'); ?>
            </div>
        </div>
    </div>

    <div class="dark-transparent sidebartoggler"></div>
    <?php 
        require_once('components/view/_error_modal.php');
        require_once('components/view/_required_js.php');
    ?>

    <script src="./assets/libs/max-length/bootstrap-maxlength.min.js"></script>
    <script src="./assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="./assets/libs/datatables.net/js/dataTables.responsive.min.js"></script>
    <?php
        $version = rand();

        if ($newRecord) {
            $scriptFile = './apps/security/system-action/js/system-action-new.js';
        } 
        elseif (!empty($detailID)) {
            $scriptFile = './apps/security/system-action/js/system-action-details.js';
        } 
        elseif (isset($_GET['import']) && !empty($_GET['import'])) {
            $scriptFile = './components/js/import.js'; 
        } 
        else {
            $scriptFile = './apps/security/system-action/js/system-action.js';
        }

        $scriptLink = '<script src="' . $scriptFile . '?v=' . $version . '"></script>';

        echo $scriptLink;
    ?>
</body>

</html>