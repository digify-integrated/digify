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

    # -------------------------------------------------------------
    #   Update methods
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateLoginAttempt($p_user_account_id, $p_failed_login_attempts, $p_last_failed_login_attempt) {
        $stmt = $this->db->getConnection()->prepare('CALL updateLoginAttempt(:p_user_account_id, :p_failed_login_attempts, :p_last_failed_login_attempt)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_failed_login_attempts', $p_failed_login_attempts, PDO::PARAM_STR);
        $stmt->bindValue(':p_last_failed_login_attempt', $p_last_failed_login_attempt, PDO::PARAM_STR);
        $stmt->execute();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateAccountLock($p_user_account_id, $p_locked, $p_lock_duration) {
        $stmt = $this->db->getConnection()->prepare('CALL updateAccountLock(:p_user_account_id, :p_locked, :p_lock_duration)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_locked', $p_locked, PDO::PARAM_STR);
        $stmt->bindValue(':p_lock_duration', $p_lock_duration, PDO::PARAM_INT);
        $stmt->execute();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateOTP($p_user_account_id, $p_otp, $p_otp_expiry_date, $p_failed_otp_attempts) {
        $stmt = $this->db->getConnection()->prepare('CALL updateOTP(:p_user_account_id, :p_otp, :p_otp_expiry_date, :p_failed_otp_attempts)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_otp', $p_otp, PDO::PARAM_STR);
        $stmt->bindValue(':p_otp_expiry_date', $p_otp_expiry_date, PDO::PARAM_STR);
        $stmt->bindValue(':p_failed_otp_attempts', $p_failed_otp_attempts, PDO::PARAM_STR);
        $stmt->execute();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateLastConnection($p_user_account_id, $p_session_token, $p_last_connection_date) {
        $stmt = $this->db->getConnection()->prepare('CALL updateLastConnection(:p_user_account_id, :p_session_token, :p_last_connection_date)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_session_token', $p_session_token, PDO::PARAM_STR);
        $stmt->bindValue(':p_last_connection_date', $p_last_connection_date, PDO::PARAM_STR);
        $stmt->execute();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateOTPAsExpired($p_user_account_id, $p_otp_expiry_date) {
        $stmt = $this->db->getConnection()->prepare('CALL updateOTPAsExpired(:p_user_account_id, :p_otp_expiry_date)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_otp_expiry_date', $p_otp_expiry_date, PDO::PARAM_STR);
        $stmt->execute();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateFailedOTPAttempts($p_user_account_id, $p_failed_otp_attempts) {
        $stmt = $this->db->getConnection()->prepare('CALL updateFailedOTPAttempts(:p_user_account_id, :p_failed_otp_attempts)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_failed_otp_attempts', $p_failed_otp_attempts, PDO::PARAM_INT);
        $stmt->execute();
    }
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    public function updateResetToken($p_user_account_id, $p_resetToken, $p_resetToken_expiry_date) {
        $stmt = $this->db->getConnection()->prepare('CALL updateResetToken(:p_user_account_id, :p_resetToken, :p_resetToken_expiry_date)');
        $stmt->bindValue(':p_user_account_id', $p_user_account_id, PDO::PARAM_INT);
        $stmt->bindValue(':p_resetToken', $p_resetToken, PDO::PARAM_STR);
        $stmt->bindValue(':p_resetToken_expiry_date', $p_resetToken_expiry_date, PDO::PARAM_STR);
        $stmt->execute();
    }
    # -------------------------------------------------------------
}
?>