<?php

class AppModuleModel {
    public $db;

    public function __construct(DatabaseModel $db) {
        $this->db = $db;
    }

    # -------------------------------------------------------------
    #   Get methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function getAppModule($p_app_module_id) {
        $stmt = $this->db->getConnection()->prepare('CALL getAppModule(:p_app_module_id)');
        $stmt->bindValue(':p_app_module_id', $p_app_module_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    # -------------------------------------------------------------
    
}
?>