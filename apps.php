<?php
    require('components/view/_required_php.php');   

    $pageTitle = 'Apps';
?>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">

<head>
    <?php require_once('components/view/_head_meta_tags.php'); ?>
    <?php require_once('components/view/_head_stylesheet.php'); ?>
</head>

<body>
    <?php require_once('components/view/_preloader.php'); ?>
    <div id="main-wrapper" class="o_home_menu_background">
        <div class="position-relative overflow-hidden min-vh-100 w-100 d-flex justify-content-center">
            <div class="d-flex justify-content-center w-100">
                <div class="row justify-content-center w-100 my-5 my-xl-0">
                    <div class="col-md-8 d-flex flex-column mt-11">
                        <div class="row justify-content-center w-100 my-5 my-xl-0">
                            <?php
                                $apps = '';
                                    
                                $sql = $databaseModel->getConnection()->prepare('CALL buildAppModuleStack(:userID)');
                                $sql->bindValue(':userID', $userID, PDO::PARAM_INT);
                                $sql->execute();
                                $options = $sql->fetchAll(PDO::FETCH_ASSOC);
                                $sql->closeCursor();
                                
                                foreach ($options as $row) {
                                    $appModuleID = $row['app_module_id'];
                                    $appModuleName = $row['app_module_name'];
                                    $appModuleDescription = $row['app_module_description'];
                                    $menuItemID = $row['menu_item_id'];
                                    $appLogo = $systemModel->checkImage($row['app_logo'], 'app module logo');

                                    $menuItemDetails = $menuItemModel->getMenuItem($menuItemID);
                                    $menuItemURL = $menuItemDetails['menu_item_url'];
                                            
                                    $apps .= ' <div class="col-lg-3">
                                                <a class="mb-3 hover-img" href="'. $menuItemURL .'?app_module_id='. $securityModel->encryptData($appModuleID) .'&page_id='. $securityModel->encryptData($menuItemID) .'">
                                                    <div class="card mb-2" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="'. $appModuleDescription .'">
                                                        <div class="card-body text-center">
                                                            <div class="position-relative overflow-hidden d-inline-block">
                                                                <img src="'. $appLogo .'" alt="app-logo" class="img-fluid position-relative" width="75" height="75">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <h5 class="fw-normal fs-4 text-dark text-center">'. $appModuleName .'</h5>
                                                </a>
                                            </div>';
                                }
                                
                                echo $apps;
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php 
        require_once('components/view/_error_modal.php');
        require_once('components/view/_required_js.php');
    ?>
</body>

</html>