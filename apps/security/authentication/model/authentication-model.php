<?php
class AuthenticationModel {
    public $db;

    public function __construct(DatabaseModel $db) {
        $this->db = $db;
    }

    # -------------------------------------------------------------
    #   Get methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function getLoginCredentials($p_user_account_id, $p_credentials) {
        $stmt = $this->db->getConnection()->prepare('CALL getLoginCredentials(:p_user_account_id, :p_credentials)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_credentials', $p_credentials, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    #   Check exist methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function checkLoginCredentialsExist($p_user_account_id, $p_credentials) {
        $stmt = $this->db->getConnection()->prepare('CALL checkLoginCredentialsExist(:p_user_account_id, :p_credentials)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_credentials', $p_credentials, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    # -------------------------------------------------------------
}
?>