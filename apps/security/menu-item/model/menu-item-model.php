<?php

class MenuItemModel {
    public $db;

    public function __construct(DatabaseModel $db) {
        $this->db = $db;
    }
    
    # -------------------------------------------------------------
    public function getMenuItem($p_menu_item_id) {
        $stmt = $this->db->getConnection()->prepare('CALL getMenuItem(:p_menu_item_id)');
        $stmt->bindValue(':p_menu_item_id', $p_menu_item_id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        return $result;
    }
    # -------------------------------------------------------------
}
?>