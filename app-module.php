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
    <link rel="stylesheet" href="./assets/libs/select2/dist/css/select2.min.css">
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

                        /*if($newRecord){
                            require_once('components/app-module/view/_app_module_new.php');
                        }
                        else if(!empty($detailID)){
                            require_once('components/app-module/view/_app_module_details.php');
                        }
                        else{
                            require_once('components/app-module/view/_app_module.php');
                        }*/
                    ?>
                </div>
                <?php #require_once('components/global/view/_customizer.php'); ?>
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
    <script src="./assets/libs/select2/dist/js/select2.full.min.js"></script>
    <script src="./assets/libs/select2/dist/js/select2.min.js"></script>

    <?php
        $scriptLink = 'app-module.js';

        if($newRecord){
            $scriptLink = 'app-module-new.js';
        }
        else if(!empty($detailID)){
            $scriptLink = 'app-module-details.js';
        }

        echo '<script src="./apps/security/app-module/js/'. $scriptLink .'?v=' . rand() .'"></script>';
    ?>
</body>

</html>