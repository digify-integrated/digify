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
        case 'menu item table':
            $filterAppModule = isset($_POST['app_module_filter']) && is_array($_POST['app_module_filter']) 
            ? "'" . implode("','", array_map('trim', $_POST['app_module_filter'])) . "'" 
            : null;
            $filterMenuGroup = isset($_POST['menu_group_filter']) && is_array($_POST['menu_group_filter']) 
            ? "'" . implode("','", array_map('trim', $_POST['menu_group_filter'])) . "'" 
            : null;
            $filterParentID = isset($_POST['parent_id_filter']) && is_array($_POST['parent_id_filter']) 
            ? "'" . implode("','", array_map('trim', $_POST['parent_id_filter'])) . "'" 
            : null;

            $sql = $databaseModel->getConnection()->prepare('CALL generateMenuItemTable(:filterAppModule, :filterMenuGroup, :filterParentID)');
            $sql->bindValue(':filterAppModule', $filterAppModule, PDO::PARAM_STR);
            $sql->bindValue(':filterMenuGroup', $filterMenuGroup, PDO::PARAM_STR);
            $sql->bindValue(':filterParentID', $filterParentID, PDO::PARAM_STR);
            $sql->execute();
            $options = $sql->fetchAll(PDO::FETCH_ASSOC);
            $sql->closeCursor();

            foreach ($options as $row) {
                $menuItemID = $row['menu_item_id'];
                $menuItemName = $row['menu_item_name'];
                $menuGroupName = $row['menu_group_name'];
                $appModuleName = $row['app_module_name'];
                $parentName = $row['parent_name'];
                $orderSequence = $row['order_sequence'];

                $menuItemIDEncrypted = $securityModel->encryptData($menuItemID);

                $response[] = [
                    'CHECK_BOX' => '<input class="form-check-input datatable-checkbox-children" type="checkbox" value="'. $menuItemID .'">',
                    'MENU_ITEM_NAME' => $menuItemName,
                    'MENU_GROUP_NAME' => $menuGroupName,
                    'APP_MODULE_NAME' => $appModuleName,
                    'PARENT_NAME' => $parentName,
                    'ORDER_SEQUENCE' => $orderSequence,
                    'LINK' => $pageLink .'&id='. $menuItemIDEncrypted
                ];
            }

            echo json_encode($response);
        break;
        # -------------------------------------------------------------

        # -------------------------------------------------------------
        case 'menu item options':
            $multiple = (isset($_POST['multiple'])) ? filter_input(INPUT_POST, 'multiple', FILTER_VALIDATE_INT) : false;
            $menuItemID = isset($_POST['menu_item_id']) ? filter_input(INPUT_POST, 'menu_item_id', FILTER_VALIDATE_INT) : null;

            $sql = $databaseModel->getConnection()->prepare('CALL generateMenuItemOptions(:menuItemID)');
            $sql->bindValue(':menuItemID', $menuItemID, PDO::PARAM_INT);
            $sql->execute();
            $options = $sql->fetchAll(PDO::FETCH_ASSOC);
            $sql->closeCursor();

            if(!$multiple){
                $response[] = [
                    'id' => '',
                    'text' => '--'
                ];
            }

            foreach ($options as $row) {
                $response[] = [
                    'id' => $row['menu_item_id'],
                    'text' => $row['menu_item_name']
                ];
            }

            echo json_encode($response);
        break;
        # -------------------------------------------------------------
    }
}

?>