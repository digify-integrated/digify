<?php

class RoleModel {
    public $db;

    public function __construct(DatabaseModel $db) {
        $this->db = $db;
    }

    # -------------------------------------------------------------
    #   Check exist methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function checkRoleExist($p_role_id) {
        $stmt = $this->db->getConnection()->prepare('CALL checkRoleExist(:p_role_id)');
        $stmt->bindValue(':p_role_id', $p_role_id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        return $result;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function checkRolePermissionExist($p_role_permission_id) {
        $stmt = $this->db->getConnection()->prepare('CALL checkRolePermissionExist(:p_role_permission_id)');
        $stmt->bindValue(':p_role_permission_id', $p_role_permission_id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        return $result;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Save exist methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function saveRole($p_role_id, $p_role_name, $p_role_url, $p_role_icon, $p_menu_group_id, $p_menu_group_name, $p_app_module_id, $p_app_module_name, $p_parent_id, $p_parent_name, $p_order_sequence, $p_last_log_by) {
        $stmt = $this->db->getConnection()->prepare('CALL saveRole(:p_role_id, :p_role_name, :p_role_url, :p_role_icon, :p_menu_group_id, :p_menu_group_name, :p_app_module_id, :p_app_module_name, :p_parent_id, :p_parent_name, :p_order_sequence, :p_last_log_by, @p_new_role_id)');
        $stmt->bindValue(':p_role_id', $p_role_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_role_name', $p_role_name, PDO::PARAM_STR);
        $stmt->bindValue(':p_role_url', $p_role_url, PDO::PARAM_STR);
        $stmt->bindValue(':p_role_icon', $p_role_icon, PDO::PARAM_STR);
        $stmt->bindValue(':p_menu_group_id', $p_menu_group_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_menu_group_name', $p_menu_group_name, PDO::PARAM_INT);
        $stmt->bindValue(':p_app_module_id', $p_app_module_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_app_module_name', $p_app_module_name, PDO::PARAM_STR);
        $stmt->bindValue(':p_parent_id', $p_parent_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_parent_name', $p_parent_name, PDO::PARAM_STR);
        $stmt->bindValue(':p_order_sequence', $p_order_sequence, PDO::PARAM_INT);
        $stmt->bindValue(':p_last_log_by', $p_last_log_by, PDO::PARAM_INT);
        $stmt->execute();

        $result = $this->db->getConnection()->query('SELECT @p_new_role_id AS role_id');
        $appModuleID = $result->fetch(PDO::FETCH_ASSOC)['role_id'];

        $stmt->closeCursor();
        
        return $appModuleID;
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Update exist methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateRolePermission($p_role_permission_id, $p_access_type, $p_access, $p_last_log_by) {
        $stmt = $this->db->getConnection()->prepare('CALL updateRolePermission(:p_role_permission_id, :p_access_type, :p_access, :p_last_log_by)');
        $stmt->bindValue(':p_role_permission_id', $p_role_permission_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_access_type', $p_access_type, PDO::PARAM_STR);
        $stmt->bindValue(':p_access', $p_access, PDO::PARAM_INT);
        $stmt->bindValue(':p_last_log_by', $p_last_log_by, PDO::PARAM_INT);
        $stmt->execute();
        $stmt->closeCursor();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Delete methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function deleteRole($p_role_id) {
        $stmt = $this->db->getConnection()->prepare('CALL deleteRole(:p_role_id)');
        $stmt->bindValue(':p_role_id', $p_role_id, PDO::PARAM_INT);
        $stmt->execute();
        $stmt->closeCursor();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Get methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function getRole($p_role_id) {
        $stmt = $this->db->getConnection()->prepare('CALL getRole(:p_role_id)');
        $stmt->bindValue(':p_role_id', $p_role_id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        return $result;
    }
    # -------------------------------------------------------------
    
}
?>