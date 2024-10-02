<?php
require('../../../../components/configurations/session.php');
require('../../../../components/configurations/config.php');
require('../../../../components/model/database-model.php');
require('../../../../components/model/system-model.php');
require('../../../../components/model/security-model.php');
require('../../../../apps/security/authentication/model/authentication-model.php');

$databaseModel = new DatabaseModel();
$systemModel = new SystemModel();
$securityModel = new SecurityModel();
$authenticationModel = new AuthenticationModel($databaseModel, $securityModel);

if(isset($_POST['type']) && !empty($_POST['type'])){
    $type = htmlspecialchars($_POST['type'], ENT_QUOTES, 'UTF-8');
    $pageID = isset($_POST['page_id']) ? $_POST['page_id'] : null;
    $pageLink = isset($_POST['page_link']) ? $_POST['page_link'] : null;
    $response = [];
    
    switch ($type) {
        # -------------------------------------------------------------
        case 'app module table':
            $sql = $databaseModel->getConnection()->prepare('CALL generateAppModuleTable()');
            $sql->execute();
            $options = $sql->fetchAll(PDO::FETCH_ASSOC);
            $sql->closeCursor();

            $appModuleDeleteAccess = $authenticationModel->checkAccessRights($userID, $pageID, 'delete');

            foreach ($options as $row) {
                $appModuleID = $row['app_module_id'];
                $appModuleName = $row['app_module_name'];
                $appModuleDescription = $row['app_module_description'];
                $orderSequence = $row['order_sequence'];
                $appLogo = $systemModel->checkImage(str_replace('../', './apps/', $row['app_logo'])  ?? null, 'app module logo');

                $appModuleIDEncrypted = $securityModel->encryptData($appModuleID);

                $deleteButton = '';
                if($appModuleDeleteAccess['total'] > 0){
                    $deleteButton = '<a href="javascript:void(0);" class="text-danger ms-3 delete-app-module" data-app-module-id="' . $appModuleID . '" title="Delete App Module">
                                    <i class="ti ti-trash fs-5"></i>
                                </a>';
                }

                $response[] = [
                    'CHECK_BOX' => '<input class="form-check-input datatable-checkbox-children" type="checkbox" value="'. $appModuleID .'">',
                    'APP_MODULE_NAME' => '<div class="d-flex align-items-center">
                                            <img src="'. $appLogo .'" alt="app-logo" width="45" />
                                            <div class="ms-3">
                                                <div class="user-meta-info">
                                                    <h6 class="mb-0">'. $appModuleName .'</h6>
                                                    <small class="text-wrap">'. $appModuleDescription .'</small>
                                                </div>
                                            </div>
                                        </div>',
                    'LINK' => $pageLink .'&id='. $appModuleIDEncrypted
                ];
            }

            echo json_encode($response);
        break;
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        case 'app module options':
            $sql = $databaseModel->getConnection()->prepare('CALL generateAppModuleOptions()');
            $sql->execute();
            $options = $sql->fetchAll(PDO::FETCH_ASSOC);
            $sql->closeCursor();

            $response[] = [
                'id' => '',
                'text' => '--'
            ];

            foreach ($options as $row) {
                $response[] = [
                    'id' => $row['app_module_id'],
                    'text' => $row['app_module_name']
                ];
            }

            echo json_encode($response);
        break;
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        case 'app module radio filter':
            $sql = $databaseModel->getConnection()->prepare('CALL generateAppModuleOptions()');
            $sql->execute();
            $options = $sql->fetchAll(PDO::FETCH_ASSOC);
            $sql->closeCursor();

            $filterOptions = '<div class="form-check py-2 mb-0">
                            <input class="form-check-input p-2" type="radio" name="filter-app-module" id="filter-app-module-all" value="" checked>
                            <label class="form-check-label d-flex align-items-center ps-2" for="filter-app-module-all">All</label>
                        </div>';

            foreach ($options as $row) {
                $appModuleID = $row['app_module_id'];
                $appModuleName = $row['app_module_name'];

                $filterOptions .= '<div class="form-check py-2 mb-0">
                                <input class="form-check-input p-2" type="radio" name="filter-app-module" id="filter-app-module-'. $appModuleID .'" value="'. $appModuleID .'">
                                <label class="form-check-label d-flex align-items-center ps-2" for="filter-app-module-'. $appModuleID .'">'. $appModuleName .'</label>
                            </div>';
            }

            $response[] = [
                'filterOptions' => $filterOptions
            ];

            echo json_encode($response);
        break;
        # -------------------------------------------------------------
    }
}

?>