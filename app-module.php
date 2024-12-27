<?php
    require_once './app/Views/Includes/required-php.php'; 
    require_once './app/Views/Includes/page-details.php'; 
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
    <?php //require_once './app/Views/Includes/preloader.php'; ?>
    <div class="d-flex flex-column flex-root app-root" id="kt_app_root">
        <div class="app-page flex-column flex-column-fluid" id="kt_app_page">
            <?php require_once './app/Views/Includes/header.php'; ?>
            <div class="app-wrapper flex-column flex-row-fluid" id="kt_app_wrapper">
                <?php require_once './app/Views/Includes/breadcrumbs.php'; ?>
                <div class="app-container container-xxl">
                    <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
                        <div class="d-flex flex-column flex-column-fluid">
                            <div id="kt_app_content" class="app-content flex-column-fluid">
                                <?php 
                                    if($newRecord){
                                        require_once './app/Views/Modules/app-module/_app_module_new.php';
                                    }
                                    else if(!empty($detailID)){
                                        require_once './app/Views/Modules/app-module/_app_module_details.php';
                                    }
                                    else if(isset($_GET['import']) && !empty($_GET['import'])){
                                        require_once './components/view/_import.php';
                                    }
                                    else{
                                        require_once './app/Views/Modules/app-module/_app_module.php';
                                    }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php 
        require_once './app/Views/Includes/error-modal.php';
        require_once './app/Views/Includes/required-js.php';        
    ?>
    
    <script src="./assets/plugins/datatables/datatables.bundle.js"></script>

    <?php
        $version = rand();
        $scriptFile = './apps/settings/app-module/js/app-module.js';

        if ($newRecord) {
            $scriptFile = './apps/settings/app-module/js/app-module-new.js';
        }
        elseif (!empty($detailID)) {
            $scriptFile = './apps/settings/app-module/js/app-module-details.js';
        }
        elseif (isset($_GET['import']) && !empty($_GET['import'])) {
            $scriptFile = './components/js/import.js'; 
        }
    ?>
    
    <script src="<?= $scriptFile ?>?v=<?= $version ?>"></script>

</body>
</html>