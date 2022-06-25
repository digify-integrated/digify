/* Create Table */

CREATE TABLE global_user_account(
	USERNAME VARCHAR(50) PRIMARY KEY,
	PASSWORD VARCHAR(200) NOT NULL,
	USER_STATUS VARCHAR(10) NOT NULL,
	PASSWORD_EXPIRY_DATE DATE NOT NULL,
	FAILED_LOGIN INT(1) NOT NULL,
	LAST_FAILED_LOGIN DATETIME,
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_transaction_log( 
	TRANSACTION_LOG_ID VARCHAR(100) NOT NULL,
	USERNAME VARCHAR(50) NOT NULL,
	LOG_TYPE VARCHAR(100) NOT NULL,
	LOG_DATE DATETIME NOT NULL,
	LOG VARCHAR(4000)
);

CREATE TABLE global_system_parameters(
	PARAMETER_ID INT PRIMARY KEY,
	PARAMETER VARCHAR(100) NOT NULL,
	PARAMETER_DESCRIPTION VARCHAR(100) NOT NULL,
	PARAMETER_EXTENSION VARCHAR(10),
	PARAMETER_NUMBER INT NOT NULL,
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_policy(
	POLICY_ID INT(50) PRIMARY KEY,
	POLICY VARCHAR(100) NOT NULL,
	POLICY_DESCRIPTION VARCHAR(200) NOT NULL,
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_permission(
	PERMISSION_ID INT(50) PRIMARY KEY,
	POLICY_ID INT(50) NOT NULL,
	PERMISSION VARCHAR(100) NOT NULL,
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_role(
	ROLE_ID VARCHAR(50) PRIMARY KEY,
	ROLE VARCHAR(100) NOT NULL,
	ROLE_DESCRIPTION VARCHAR(200) NOT NULL,
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_role_user_account(
	ROLE_ID VARCHAR(50) NOT NULL,
	USERNAME VARCHAR(50) NOT NULL,
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_role_permission(
	ROLE_ID VARCHAR(50) NOT NULL,
	PERMISSION_ID INT(20) NOT NULL,
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_system_code(
	SYSTEM_TYPE VARCHAR(20) NOT NULL,
	SYSTEM_CODE VARCHAR(20) NOT NULL,
	SYSTEM_DESCRIPTION VARCHAR(100) NOT NULL,
	TRANSACTION_LOG_ID VARCHAR(100)
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_upload_setting(
	UPLOAD_SETTING_ID INT(50) PRIMARY KEY,
	UPLOAD_SETTING VARCHAR(200) NOT NULL,
	DESCRIPTION VARCHAR(200) NOT NULL,
	MAX_FILE_SIZE DOUBLE,
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_upload_file_type(
	UPLOAD_SETTING_ID INT(50),
	FILE_TYPE VARCHAR(50) NOT NULL,
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_company(
	COMPANY_ID VARCHAR(50) PRIMARY KEY,
	COMPANY_NAME VARCHAR(100) NOT NULL,
	COMPANY_LOGO VARCHAR(500),
	EMAIL VARCHAR(50),
	TELEPHONE VARCHAR(20),
	MOBILE VARCHAR(20),
	WEBSITE VARCHAR(100),
	TAX_ID VARCHAR(100),
	STREET_1 VARCHAR(200),
	STREET_2 VARCHAR(200),
	COUNTRY_ID INT,
	STATE_ID INT,
	CITY VARCHAR(100),
	ZIP_CODE VARCHAR(10),
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_country(
	COUNTRY_ID INT PRIMARY KEY,
	COUNTRY_NAME VARCHAR(200) NOT NULL,
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_state(
	STATE_ID INT PRIMARY KEY,
	STATE_NAME VARCHAR(200) NOT NULL,
	COUNTRY_ID INT NOT NULL,
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_notification_setting(
	NOTIFICATION_SETTING_ID INT(50) PRIMARY KEY,
	NOTIFICATION_SETTING VARCHAR(100) NOT NULL,
	NOTIFICATION_SETTING_DESCRIPTION VARCHAR(200) NOT NULL,
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_notification_template(
	NOTIFICATION_SETTING_ID INT(50) PRIMARY KEY,
	NOTIFICATION_TITLE VARCHAR(500),
	NOTIFICATION_MESSAGE VARCHAR(500),
	SYSTEM_LINK VARCHAR(200),
	EMAIL_LINK VARCHAR(200),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_notification_user_account_recipient(
	NOTIFICATION_SETTING_ID INT(50),
	USERNAME VARCHAR(50) NOT NULL,
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_notification_role_recipient(
	NOTIFICATION_SETTING_ID INT(50),
	ROLE_ID VARCHAR(50) NOT NULL,
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_notification_channel(
	NOTIFICATION_SETTING_ID INT(50),
	CHANNEL VARCHAR(20) NOT NULL,
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_interface_setting(
	INTERFACE_SETTING_ID INT(50) PRIMARY KEY,
	LOGIN_BACKGROUND VARCHAR(500),
	LOGIN_LOGO VARCHAR(500),
	MENU_LOGO VARCHAR(500),
	MENU_ICON VARCHAR(500),
	FAVICON VARCHAR(500),
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_mail_configuration(
	MAIL_CONFIGURATION_ID INT PRIMARY KEY,
	MAIL_HOST VARCHAR(100) NOT NULL,
	PORT INT NOT NULL,
	SMTP_AUTH INT(1) NOT NULL,
	SMTP_AUTO_TLS INT(1) NOT NULL,
	USERNAME VARCHAR(200) NOT NULL,
	PASSWORD VARCHAR(200) NOT NULL,
	MAIL_ENCRYPTION VARCHAR(20),
	MAIL_FROM_NAME VARCHAR(200),
	MAIL_FROM_EMAIL VARCHAR(200),
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE global_zoom_integration(
	ZOOM_INTEGRATION_ID INT PRIMARY KEY,
	API_KEY VARCHAR(1000) NOT NULL,
	API_SECRET VARCHAR(1000) NOT NULL,
    TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE employee_department(
	DEPARTMENT_ID VARCHAR(50) PRIMARY KEY,
	DEPARTMENT VARCHAR(100) NOT NULL,
	PARENT_DEPARTMENT VARCHAR(50),
	MANAGER VARCHAR(100),
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE employee_job_position(
	JOB_POSITION_ID VARCHAR(50) PRIMARY KEY,
	JOB_POSITION VARCHAR(100) NOT NULL,
	JOB_DESCRIPTION VARCHAR(500),
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE employee_work_location(
	WORK_LOCATION_ID VARCHAR(50) PRIMARY KEY,
	WORK_LOCATION VARCHAR(100) NOT NULL,
	EMAIL VARCHAR(50),
	TELEPHONE VARCHAR(20),
	MOBILE VARCHAR(20),
	STREET_1 VARCHAR(200),
	STREET_2 VARCHAR(200),
	COUNTRY_ID INT,
	STATE_ID INT,
	CITY VARCHAR(100),
	ZIP_CODE VARCHAR(10),
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE employee_departure_reason(
	DEPARTURE_REASON_ID VARCHAR(50) PRIMARY KEY,
	DEPARTURE_REASON VARCHAR(100) NOT NULL,
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE employee_details(
	EMPLOYEE_ID VARCHAR(100) PRIMARY KEY,
	USERNAME VARCHAR(50),
	BADGE_ID VARCHAR(100),
	EMPLOYEE_IMAGE VARCHAR(500),
	FILE_AS VARCHAR(350) NOT NULL,
	FIRST_NAME VARCHAR(100) NOT NULL,
	MIDDLE_NAME VARCHAR(100) NOT NULL,
	LAST_NAME VARCHAR(100) NOT NULL,
	SUFFIX VARCHAR(5),
	COMPANY VARCHAR(50),
	JOB_POSITION VARCHAR(50),
	DEPARTMENT VARCHAR(50),
	WORK_LOCATION VARCHAR(50),
	WORKING_HOURS VARCHAR(50),
	MANAGER VARCHAR(100),
	COACH VARCHAR(100),
	EMPLOYEE_TYPE VARCHAR(100),
	EMPLOYEE_STATUS VARCHAR(100),
	PERMANENCY_DATE DATE,
	ONBOARD_DATE DATE,
	OFFBOARD_DATE DATE,
	DEPARTURE_REASON VARCHAR(50),
	DETAILED_REASON VARCHAR(500),
	WORK_EMAIL VARCHAR(50),
	WORK_TELEPHONE VARCHAR(20),
	WORK_MOBILE VARCHAR(20),
	SSS VARCHAR(20),
	TIN VARCHAR(20),
	PAGIBIG VARCHAR(20),
	PHILHEALTH VARCHAR(20),
	BANK_ACCOUNT_NUMBER VARCHAR(100),
	HOME_WORK_DISTANCE DOUBLE,
	PERSONAL_EMAIL VARCHAR(50),
	PERSONAL_TELEPHONE VARCHAR(20),
	PERSONAL_MOBILE VARCHAR(20),
	STREET_1 VARCHAR(200),
	STREET_2 VARCHAR(200),
	COUNTRY_ID INT,
	STATE_ID INT,
	CITY VARCHAR(100),
	ZIP_CODE VARCHAR(10),
	MARITAL_STATUS VARCHAR(20),
	SPOUSE_NAME VARCHAR(500),
	SPOUSE_BIRTHDAY DATE,
	EMERGENCY_CONTACT VARCHAR(500),
	EMERGENCY_PHONE VARCHAR(20),
	NATIONALITY INT,
	IDENTIFICATION_NUMBER VARCHAR(100),
	PASSPORT_NUMBER VARCHAR(100),
	GENDER VARCHAR(20),
	BIRTHDAY DATE,
	CERTIFICATE_LEVEL VARCHAR(20),
	FIELD_OF_STUDY VARCHAR(200),
	SCHOOL VARCHAR(200),
	PLACE_OF_BIRTH VARCHAR(500),
	NUMBER_OF_CHILDREN INT,
	VISA_NUMBER VARCHAR(100),
	WORK_PERMIT_NUMBER VARCHAR(100),
	VISA_EXPIRY_DATE DATE,
	WORK_PERMIT_EXPIRY_DATE DATE,
	WORK_PERMIT VARCHAR(500),
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

CREATE TABLE employee_type(
	EMPLOYEE_TYPE_ID VARCHAR(50) PRIMARY KEY,
	EMPLOYEE_TYPE VARCHAR(100) NOT NULL,
	TRANSACTION_LOG_ID VARCHAR(100),
	RECORD_LOG VARCHAR(100)
);

/* Index */
CREATE INDEX global_user_account_index ON global_user_account(USERNAME);
CREATE INDEX global_system_parameter_index ON global_system_parameters(PARAMETER_ID);
CREATE INDEX global_policy_index ON global_policy(POLICY_ID);
CREATE INDEX global_permission_index ON global_policy(POLICY_ID);
CREATE INDEX global_role_index ON global_role(ROLE_ID);
CREATE INDEX global_system_code_index ON global_system_code(SYSTEM_TYPE, SYSTEM_CODE);
CREATE INDEX global_upload_setting_index ON global_upload_setting(UPLOAD_SETTING_ID);
CREATE INDEX global_company_index ON global_company(COMPANY_ID);
CREATE INDEX global_country_index ON global_country(COUNTRY_ID);
CREATE INDEX global_state_index ON global_state(STATE_ID);
CREATE INDEX global_notification_setting_index ON global_notification_setting(NOTIFICATION_SETTING_ID);
CREATE INDEX global_notification_template_index ON global_notification_template(NOTIFICATION_SETTING_ID);
CREATE INDEX global_interface_setting_index ON global_interface_setting(INTERFACE_SETTING_ID);
CREATE INDEX global_mail_configuration_index ON global_mail_configuration(MAIL_CONFIGURATION_ID);
CREATE INDEX global_zoom_integration_index ON global_zoom_integration(ZOOM_INTEGRATION_ID);
CREATE INDEX employee_department_index ON employee_department(DEPARTMENT_ID);
CREATE INDEX employee_job_position_index ON employee_job_position(JOB_POSITION_ID);
CREATE INDEX employee_work_location_index ON employee_work_location(WORK_LOCATION_ID);
CREATE INDEX employee_departure_reason_index ON employee_departure_reason(DEPARTURE_REASON_ID);
CREATE INDEX employee_details_index ON employee_details(EMPLOYEE_ID);
CREATE INDEX employee_type_index ON employee_type(EMPLOYEE_TYPE_ID);
CREATE INDEX employee_private_information_index ON employee_private_information(EMPLOYEE_ID);

/* Stored Procedure */

CREATE PROCEDURE check_user_account_exist(IN username VARCHAR(50))
BEGIN
	SET @username = username;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_user_account WHERE BINARY USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_user_account_details(IN username VARCHAR(50))
BEGIN
	SET @username = username;

	SET @query = 'SELECT PASSWORD, USER_STATUS, PASSWORD_EXPIRY_DATE, FAILED_LOGIN, LAST_FAILED_LOGIN, TRANSACTION_LOG_ID, RECORD_LOG FROM global_user_account WHERE USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_login_attempt(IN username VARCHAR(50), login_attemp INT(1), last_failed_attempt_date DATETIME)
BEGIN
	SET @username = username;
	SET @login_attemp = login_attemp;
	SET @last_failed_attempt_date = last_failed_attempt_date;

    IF @login_attemp > 0 THEN
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = @login_attemp, LAST_FAILED_LOGIN = @last_failed_attempt_date WHERE USERNAME = @username';
	ELSE
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = @login_attemp WHERE USERNAME = @username';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_user_account_password(IN username VARCHAR(50), password VARCHAR(200), password_expiry_date DATE)
BEGIN
	SET @username = username;
	SET @password = password;
	SET @password_expiry_date = password_expiry_date;

	SET @query = 'UPDATE global_user_account SET PASSWORD = @password, PASSWORD_EXPIRY_DATE = @password_expiry_date WHERE USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_transaction_log(IN transaction_log_id VARCHAR(100), IN username VARCHAR(50), log_type VARCHAR(100), log_date DATETIME, log VARCHAR(4000))
BEGIN
	SET @transaction_log_id = transaction_log_id;
	SET @username = username;
	SET @log_type = log_type;
	SET @log_date = log_date;
	SET @log = log;

	SET @query = 'INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES(@transaction_log_id, @username, @log_type, @log_date, @log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_permission_count(IN role_id VARCHAR(50), IN permission_id INT)
BEGIN
	SET @role_id = role_id;
	SET @permission_id = permission_id;

	SET @query = 'SELECT COUNT(PERMISSION_ID) AS TOTAL FROM global_role_permission WHERE ROLE_ID = @role_id AND PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_policy_exist(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_policy WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_policy(IN policy_id INT, IN policy VARCHAR(100), IN policy_description VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @policy_id = policy_id;
	SET @policy = policy;
	SET @policy_description = policy_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_policy SET POLICY = @policy, POLICY_DESCRIPTION = @policy_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_policy(IN policy_id INT, IN policy VARCHAR(100), IN policy_description VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @policy_id = policy_id;
	SET @policy = policy;
	SET @policy_description = policy_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_policy (POLICY_ID, POLICY, POLICY_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@policy_id, @policy, @policy_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_policy_details(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'SELECT POLICY, POLICY_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_policy WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_policy(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'DELETE FROM global_policy WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_permission(IN policy_id INT)
BEGIN
	SET @policy_id = policy_id;

	SET @query = 'DELETE FROM global_permission WHERE POLICY_ID = @policy_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_permission_exist(IN permission_id INT)
BEGIN
	SET @permission_id = permission_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_permission WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_permission(IN permission_id INT, IN policy_id INT, IN permission VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @permission_id = permission_id;
	SET @permission = permission;
	SET @policy_id = policy_id;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_permission SET POLICY_ID = @policy_id, PERMISSION = @permission, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_permission(IN permission_id INT, IN policy_id INT, IN permission VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @permission_id = permission_id;
	SET @policy_id = policy_id;
	SET @permission = permission;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_permission (PERMISSION_ID, POLICY_ID, PERMISSION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@permission_id, @policy_id, @permission, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_permission_details(IN permission_id INT)
BEGIN
	SET @permission_id = permission_id;

	SET @query = 'SELECT POLICY_ID, PERMISSION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_permission WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_permission(IN permission_id INT)
BEGIN
	SET @permission_id = permission_id;

	SET @query = 'DELETE FROM global_permission WHERE PERMISSION_ID = @permission_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_system_parameter_value(IN parameter_id INT, IN parameter_number INT, IN record_log VARCHAR(100))
BEGIN
	SET @parameter_id = parameter_id;
	SET @parameter_number = parameter_number;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_system_parameters SET PARAMETER_NUMBER = @parameter_number, RECORD_LOG = @record_log WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_system_parameter(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'SELECT PARAMETER_EXTENSION, PARAMETER_NUMBER FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_role_exist(IN role_id VARCHAR(50))
BEGIN
	SET @role_id = role_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_role WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_role(IN role_id VARCHAR(100), IN role VARCHAR(100), IN role_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @role_id = role_id;
	SET @role = role;
	SET @role_description = role_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_role SET ROLE = @role, ROLE_DESCRIPTION = @role_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_role(IN role_id VARCHAR(100), IN role VARCHAR(100), IN role_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @role_id = role_id;
	SET @role = role;
	SET @role_description = role_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_role (ROLE_ID, ROLE, ROLE_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@role_id, @role, @role_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_role_details(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'SELECT ROLE, ROLE_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_role WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_role(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'DELETE FROM global_role WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_permission_role(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'DELETE FROM global_role_permission WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_permission_role(IN role_id VARCHAR(100), IN permission_id INT, IN record_log VARCHAR(100))
BEGIN
	SET @role_id = role_id;
	SET @permission_id = permission_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_role_permission (ROLE_ID, PERMISSION_ID, RECORD_LOG) VALUES (@role_id, @permission_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_role_permission_details(IN role_id VARCHAR(100))
BEGIN
	SET @role_id = role_id;

	SET @query = 'SELECT PERMISSION_ID, RECORD_LOG FROM global_role_permission WHERE ROLE_ID = @role_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_user_account_exist(IN username VARCHAR(50))
BEGIN
	SET @username = username;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_user_account WHERE USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_user_account(IN username VARCHAR(50), IN password VARCHAR(200), IN password_expiry_date DATE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @password = password;
	SET @password_expiry_date = password_expiry_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @password IS NULL OR @password = '' THEN
		SET @query = 'UPDATE global_user_account SET TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE USERNAME = @username';
	ELSE
		SET @query = 'UPDATE global_user_account SET PASSWORD = @password, PASSWORD_EXPIRY_DATE = @password_expiry_date, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE USERNAME = @username';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_user_account(IN username VARCHAR(50), IN password VARCHAR(200), IN password_expiry_date DATE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @password = password;
	SET @password_expiry_date = password_expiry_date;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_user_account (USERNAME, PASSWORD, USER_STATUS, PASSWORD_EXPIRY_DATE, FAILED_LOGIN, LAST_FAILED_LOGIN, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@username, @password, "ACTIVE", @password_expiry_date, 0, null, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_user_account_role(IN username VARCHAR(50), IN role_id VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @role_id = role_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_role_user_account (ROLE_ID, USERNAME, RECORD_LOG) VALUES(@role_id, @username, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_user_account_role(IN user_code VARCHAR(50))
BEGIN
	SET @user_code = user_code;

	SET @query = 'DELETE FROM global_role_user_account WHERE USERNAME = @user_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_user_account_lock_status(IN username VARCHAR(50), IN transaction_type VARCHAR(10), IN last_failed_login DATE, IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @transaction_type = transaction_type;
	SET @last_failed_login = last_failed_login;
	SET @record_log = record_log;

	IF @transaction_type = 'unlock' THEN
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = 0, LAST_FAILED_LOGIN = null, RECORD_LOG = @record_log WHERE USERNAME = @username';
	ELSE
		SET @query = 'UPDATE global_user_account SET FAILED_LOGIN = 5, LAST_FAILED_LOGIN = @last_failed_login, RECORD_LOG = @record_log WHERE USERNAME = @username';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_user_account_status(IN username VARCHAR(50), IN USER_STATUS VARCHAR(10), IN record_log VARCHAR(100))
BEGIN
	SET @username = username;
	SET @USER_STATUS = USER_STATUS;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_user_account SET USER_STATUS = @USER_STATUS, RECORD_LOG = @record_log WHERE USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_user_account_role_details(IN role_id VARCHAR(50), IN username VARCHAR(50))
BEGIN
	SET @role_id = role_id;
	SET @username = username;

	SET @query = 'SELECT ROLE_ID, USERNAME, RECORD_LOG FROM global_role_user_account WHERE ROLE_ID = @role_id OR USERNAME = @username';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_role_options()
BEGIN
	SET @query = 'SELECT ROLE_ID, ROLE FROM global_role ORDER BY ROLE';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_user_account_options()
BEGIN
	SET @query = 'SELECT USERNAME FROM global_user_account ORDER BY USERNAME';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_system_parameter_exist(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_system_parameter(IN parameter_id INT, IN parameter VARCHAR(100), IN parameter_description VARCHAR(100), IN extension VARCHAR(10), IN parameter_number INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @parameter_id = parameter_id;
	SET @parameter = parameter;
	SET @parameter_description = parameter_description;
	SET @extension = extension;
	SET @parameter_number = parameter_number;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_system_parameters SET PARAMETER = @parameter, PARAMETER_DESCRIPTION = @parameter_description, PARAMETER_EXTENSION = @extension, PARAMETER_NUMBER = @parameter_number, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_system_parameter(IN parameter_id INT, IN parameter VARCHAR(100), IN parameter_description VARCHAR(100), IN extension VARCHAR(10), IN parameter_number INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @parameter_id = parameter_id;
	SET @parameter = parameter;
	SET @parameter_description = parameter_description;
	SET @extension = extension;
	SET @parameter_number = parameter_number;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_system_parameters (PARAMETER_ID, PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@parameter_id, @parameter, @parameter_description, @extension, @parameter_number, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_system_parameter_details(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'SELECT PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID, RECORD_LOG FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_system_parameter(IN parameter_id INT)
BEGIN
	SET @parameter_id = parameter_id;

	SET @query = 'DELETE FROM global_system_parameters WHERE PARAMETER_ID = @parameter_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_system_code_exist(IN system_type VARCHAR(20), IN system_code VARCHAR(20))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_system_code WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_system_code(IN system_type VARCHAR(100), IN system_code VARCHAR(100), IN system_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;
	SET @system_description = system_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_system_code SET SYSTEM_DESCRIPTION = @system_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_system_code(IN system_type VARCHAR(100), IN system_code VARCHAR(100), IN system_description VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;
	SET @system_description = system_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_system_code (SYSTEM_TYPE, SYSTEM_CODE, SYSTEM_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@system_type, @system_code, @system_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_system_code_details(IN system_type VARCHAR(100), IN system_code VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;

	SET @query = 'SELECT SYSTEM_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_system_code WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_system_code_options(IN system_type VARCHAR(100))
BEGIN
	SET @system_type = system_type;

	SET @query = 'SELECT SYSTEM_CODE, SYSTEM_DESCRIPTION FROM global_system_code WHERE SYSTEM_TYPE = @system_type ORDER BY SYSTEM_DESCRIPTION';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_system_code(IN system_type VARCHAR(100), IN system_code VARCHAR(100))
BEGIN
	SET @system_type = system_type;
	SET @system_code = system_code;

	SET @query = 'DELETE FROM global_system_code WHERE SYSTEM_TYPE = @system_type AND SYSTEM_CODE = @system_code';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_upload_setting_exist(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_upload_setting WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_upload_setting(IN upload_setting_id INT(50), IN upload_setting VARCHAR(200), IN description VARCHAR(200), IN max_file_size DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @upload_setting_id = upload_setting_id;
	SET @upload_setting = upload_setting;
	SET @description = description;
	SET @max_file_size = max_file_size;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_upload_setting SET UPLOAD_SETTING = @upload_setting, DESCRIPTION = @description, MAX_FILE_SIZE = @max_file_size, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_upload_setting(IN upload_setting_id INT(50), IN upload_setting VARCHAR(200), IN description VARCHAR(200), IN max_file_size DOUBLE, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @upload_setting_id = upload_setting_id;
	SET @upload_setting = upload_setting;
	SET @description = description;
	SET @max_file_size = max_file_size;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_upload_setting (UPLOAD_SETTING_ID, UPLOAD_SETTING, DESCRIPTION, MAX_FILE_SIZE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@upload_setting_id, @upload_setting, @description, @max_file_size, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_upload_file_type(IN upload_setting_id INT(50), IN file_type VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @upload_setting_id = upload_setting_id;
	SET @file_type = file_type;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_upload_file_type (UPLOAD_SETTING_ID, FILE_TYPE, RECORD_LOG) VALUES(@upload_setting_id, @file_type, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_upload_setting_details(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'SELECT UPLOAD_SETTING, DESCRIPTION, MAX_FILE_SIZE, TRANSACTION_LOG_ID, RECORD_LOG FROM global_upload_setting WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_upload_file_type_details(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'SELECT FILE_TYPE, RECORD_LOG FROM global_upload_file_type WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_upload_setting(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'DELETE FROM global_upload_setting WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_upload_file_type(IN upload_setting_id INT(50))
BEGIN
	SET @upload_setting_id = upload_setting_id;

	SET @query = 'DELETE FROM global_upload_file_type WHERE UPLOAD_SETTING_ID = @upload_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_company_exist(IN company_id INT)
BEGIN
	SET @company_id = company_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_company WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_company(IN company_id VARCHAR(50), IN company_name VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN website VARCHAR(100), IN tax_id VARCHAR(100), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @company_id = company_id;
	SET @company_name = company_name;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @website = website;
	SET @tax_id = tax_id;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_company SET COMPANY_NAME = @company_name, EMAIL = @email, TELEPHONE = @telephone, MOBILE = @mobile, WEBSITE = @website, TAX_ID = @tax_id, STREET_1 = @street_1, STREET_2 = @street_2, COUNTRY_ID = @country_id, STATE_ID = @state_id, CITY = @city, ZIP_CODE = @zip_code, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_company(IN company_id VARCHAR(50), IN company_name VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN website VARCHAR(100), IN tax_id VARCHAR(100), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @company_id = company_id;
	SET @company_name = company_name;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @website = website;
	SET @tax_id = tax_id;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_company (COMPANY_ID, COMPANY_NAME, EMAIL, TELEPHONE, MOBILE, WEBSITE, TAX_ID, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@company_id, @company_name, @email, @telephone, @mobile, @website, @tax_id, @street_1, @street_2, @country_id, @state_id, @city, @zip_code, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_company_details(IN company_id VARCHAR(50))
BEGIN
	SET @company_id = company_id;

	SET @query = 'SELECT COMPANY_NAME, COMPANY_LOGO, EMAIL, TELEPHONE, MOBILE, WEBSITE, TAX_ID, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG FROM global_company WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_company(IN company_id VARCHAR(50))
BEGIN
	SET @company_id = company_id;

	SET @query = 'DELETE FROM global_company WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_company_logo(IN company_id VARCHAR(50), IN company_logo VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @company_id = company_id;
	SET @company_logo = company_logo;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_company SET COMPANY_LOGO = @company_logo, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE COMPANY_ID = @company_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_country_exist(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_country(IN country_id INT, IN country_name VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @country_id = country_id;
	SET @country_name = country_name;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_country SET COUNTRY_NAME = @country_name, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_country(IN country_id INT, IN country_name VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @country_id = country_id;
	SET @country_name = country_name;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_country (COUNTRY_ID, COUNTRY_NAME, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@country_id, @country_name, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_country_details(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'SELECT COUNTRY_NAME, TRANSACTION_LOG_ID, RECORD_LOG FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_country(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'DELETE FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_state_exist(IN state_id INT)
BEGIN
	SET @state_id = state_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_state WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_state(IN state_id INT, IN state_name VARCHAR(200), IN country_id INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @state_id = state_id;
	SET @state_name = state_name;
	SET @country_id = country_id;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_state SET STATE_NAME = @state_name, COUNTRY_ID = @country_id, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_state(IN state_id INT, IN state_name VARCHAR(100), IN country_id INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @state_id = state_id;
	SET @state_name = state_name;
	SET @country_id = country_id;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_state (STATE_ID, STATE_NAME, COUNTRY_ID, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@state_id, @state_name, @country_id, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_state_details(IN state_id INT)
BEGIN
	SET @state_id = state_id;

	SET @query = 'SELECT STATE_NAME, COUNTRY_ID, TRANSACTION_LOG_ID, RECORD_LOG FROM global_state WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_state(IN state_id INT)
BEGIN
	SET @state_id = state_id;

	SET @query = 'DELETE FROM global_state WHERE STATE_ID = @state_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_country_options()
BEGIN
	SET @query = 'SELECT COUNTRY_ID, COUNTRY_NAME FROM global_country ORDER BY COUNTRY_NAME';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_state(IN country_id INT)
BEGIN
	SET @country_id = country_id;

	SET @query = 'DELETE FROM global_country WHERE COUNTRY_ID = @country_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_notification_setting_exist(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_notification_setting WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_notification_setting(IN notification_setting_id INT, IN notification_setting VARCHAR(100), IN notification_setting_description VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_setting = notification_setting;
	SET @notification_setting_description = notification_setting_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_notification_setting SET NOTIFICATION_SETTING = @notification_setting, NOTIFICATION_SETTING_DESCRIPTION = @notification_setting_description, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_notification_setting(IN notification_setting_id INT, IN notification_setting VARCHAR(100), IN notification_setting_description VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_setting = notification_setting;
	SET @notification_setting_description = notification_setting_description;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_setting (NOTIFICATION_SETTING_ID, NOTIFICATION_SETTING, NOTIFICATION_SETTING_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@notification_setting_id, @notification_setting, @notification_setting_description, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_notification_setting_details(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT NOTIFICATION_SETTING, NOTIFICATION_SETTING_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM global_notification_setting WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_notification_setting(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_setting WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_notification_template(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_template WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_notification_user_account_recipient(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_user_account_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_notification_role_recipient(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_role_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_all_notification_channel(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'DELETE FROM global_notification_channel WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_notification_template_exist(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_notification_template WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_notification_template(IN notification_setting_id INT, IN notification_title VARCHAR(500), IN notificate_message VARCHAR(500), IN system_link VARCHAR(200), IN email_link VARCHAR(200), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_title = notification_title;
	SET @notificate_message = notificate_message;
	SET @system_link = system_link;
	SET @email_link = email_link;
	SET @record_log = record_log;

	SET @query = 'UPDATE global_notification_template SET NOTIFICATION_TITLE = @notification_title, NOTIFICATION_MESSAGE = @notificate_message, SYSTEM_LINK = @system_link, EMAIL_LINK = @email_link, RECORD_LOG = @record_log WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_notification_template(IN notification_setting_id INT, IN notification_title VARCHAR(500), IN notificate_message VARCHAR(500), IN system_link VARCHAR(200), IN email_link VARCHAR(200), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @notification_title = notification_title;
	SET @notificate_message = notificate_message;
	SET @system_link = system_link;
	SET @email_link = email_link;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_template (NOTIFICATION_SETTING_ID, NOTIFICATION_TITLE, NOTIFICATION_MESSAGE, SYSTEM_LINK, EMAIL_LINK, RECORD_LOG) VALUES(@notification_setting_id, @notification_title, @notificate_message, @system_link, @email_link, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_notification_template_details(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT NOTIFICATION_TITLE, NOTIFICATION_MESSAGE, SYSTEM_LINK, EMAIL_LINK, RECORD_LOG FROM global_notification_template WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_notification_role_recipient(IN notification_setting_id INT, IN role_id VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @role_id = role_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_role_recipient (NOTIFICATION_SETTING_ID, ROLE_ID, RECORD_LOG) VALUES(@notification_setting_id, @role_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_notification_user_account_recipient(IN notification_setting_id INT, IN username VARCHAR(50), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @username = username;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_user_account_recipient (NOTIFICATION_SETTING_ID, USERNAME, RECORD_LOG) VALUES(@notification_setting_id, @username, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_notification_channel(IN notification_setting_id INT, IN channel VARCHAR(20), IN record_log VARCHAR(100))
BEGIN
	SET @notification_setting_id = notification_setting_id;
	SET @channel = channel;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_notification_channel (NOTIFICATION_SETTING_ID, CHANNEL, RECORD_LOG) VALUES(@notification_setting_id, @channel, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_notification_user_account_recipient_details(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT USERNAME, RECORD_LOG FROM global_notification_user_account_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_notification_role_recipient_details(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT ROLE_ID, RECORD_LOG FROM global_notification_role_recipient WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_notification_channel_details(IN notification_setting_id INT)
BEGIN
	SET @notification_setting_id = notification_setting_id;

	SET @query = 'SELECT CHANNEL, RECORD_LOG FROM global_notification_channel WHERE NOTIFICATION_SETTING_ID = @notification_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_interface_settings_exist(IN interface_setting_id INT)
BEGIN
	SET @interface_setting_id = interface_setting_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_interface_setting WHERE INTERFACE_SETTING_ID = @interface_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_interface_settings(IN interface_setting_id INT, IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @interface_setting_id = interface_setting_id;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_interface_setting (INTERFACE_SETTING_ID, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@interface_setting_id, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_interface_settings_images(IN interface_setting_id INT, IN file_path VARCHAR(500), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100), IN request_type VARCHAR(20))
BEGIN
	SET @interface_setting_id = interface_setting_id;
	SET @file_path = file_path;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;
	SET @request_type = request_type;

	IF @request_type = 'login background' THEN
		SET @query = 'UPDATE global_interface_setting SET LOGIN_BACKGROUND = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSEIF @request_type = 'login logo' THEN
		SET @query = 'UPDATE global_interface_setting SET LOGIN_LOGO = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSEIF @request_type = 'menu logo' THEN
		SET @query = 'UPDATE global_interface_setting SET MENU_LOGO = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSEIF @request_type = 'menu icon' THEN
		SET @query = 'UPDATE global_interface_setting SET MENU_ICON = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
	ELSE
		SET @query = 'UPDATE global_interface_setting SET FAVICON = @file_path, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE INTERFACE_SETTING_ID = @interface_setting_id';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_interface_settings_details(IN interface_setting_id INT)
BEGIN
	SET @interface_setting_id = interface_setting_id;

	SET @query = 'SELECT LOGIN_BACKGROUND, LOGIN_LOGO, MENU_LOGO, MENU_ICON, FAVICON, TRANSACTION_LOG_ID, RECORD_LOG FROM global_interface_setting WHERE INTERFACE_SETTING_ID = @interface_setting_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_mail_configuration_exist(IN mail_configuration_id INT)
BEGIN
	SET @mail_configuration_id = mail_configuration_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_mail_configuration WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_mail_configuration(IN mail_configuration_id INT, IN mail_host VARCHAR(100), IN port INT, IN smtp_auth INT(1), IN smtp_auto_tls INT(1), IN username VARCHAR(200), IN password VARCHAR(200), IN mail_encryption VARCHAR(20), IN mail_from_name VARCHAR(200), IN mail_from_email VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @mail_configuration_id = mail_configuration_id;
	SET @mail_host = mail_host;
	SET @port = port;
	SET @smtp_auth = smtp_auth;
	SET @smtp_auto_tls = smtp_auto_tls;
	SET @username = username;
	SET @password = password;
	SET @mail_encryption = mail_encryption;
	SET @mail_from_name = mail_from_name;
	SET @mail_from_email = mail_from_email;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;


	SET @query = 'INSERT INTO global_mail_configuration (MAIL_CONFIGURATION_ID, MAIL_HOST, PORT, SMTP_AUTH, SMTP_AUTO_TLS, USERNAME, PASSWORD, MAIL_ENCRYPTION, MAIL_FROM_NAME, MAIL_FROM_EMAIL, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@mail_configuration_id, @mail_host, @port, @smtp_auth, @smtp_auto_tls, @username, @password, @mail_encryption, @mail_from_name, @mail_from_email, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_mail_configuration(IN mail_configuration_id INT, IN mail_host VARCHAR(100), IN port INT, IN smtp_auth INT(1), IN smtp_auto_tls INT(1), IN username VARCHAR(200), IN password VARCHAR(200), IN mail_encryption VARCHAR(20), IN mail_from_name VARCHAR(200), IN mail_from_email VARCHAR(200), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @mail_configuration_id = mail_configuration_id;
	SET @mail_host = mail_host;
	SET @port = port;
	SET @smtp_auth = smtp_auth;
	SET @smtp_auto_tls = smtp_auto_tls;
	SET @username = username;
	SET @password = password;
	SET @mail_encryption = mail_encryption;
	SET @mail_from_name = mail_from_name;
	SET @mail_from_email = mail_from_email;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @password IS NULL OR @password = '' THEN
		SET @query = 'UPDATE global_mail_configuration SET MAIL_HOST = @mail_host, PORT = @port, SMTP_AUTH = @smtp_auth, SMTP_AUTO_TLS = @smtp_auto_tls, USERNAME = @username, MAIL_ENCRYPTION = @mail_encryption, MAIL_FROM_NAME = @mail_from_name, MAIL_FROM_EMAIL = @mail_from_email, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';
	ELSE
		SET @query = 'UPDATE global_mail_configuration SET MAIL_HOST = @mail_host, PORT = @port, SMTP_AUTH = @smtp_auth, SMTP_AUTO_TLS = @smtp_auto_tls, USERNAME = @username, PASSWORD = @password, MAIL_ENCRYPTION = @mail_encryption, MAIL_FROM_NAME = @mail_from_name, MAIL_FROM_EMAIL = @mail_from_email, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';
    END IF;

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_mail_configuration_details(IN mail_configuration_id INT)
BEGIN
	SET @mail_configuration_id = mail_configuration_id;

	SET @query = 'SELECT MAIL_HOST, PORT, SMTP_AUTH, SMTP_AUTO_TLS, USERNAME, PASSWORD, MAIL_ENCRYPTION, MAIL_FROM_NAME, MAIL_FROM_EMAIL, TRANSACTION_LOG_ID, RECORD_LOG FROM global_mail_configuration WHERE MAIL_CONFIGURATION_ID = @mail_configuration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_zoom_integration_exist(IN zoom_integration_id INT)
BEGIN
	SET @zoom_integration_id = zoom_integration_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM global_zoom_integration WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_zoom_integration(IN zoom_integration_id INT, IN api_key VARCHAR(1000), IN api_secret VARCHAR(1000), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @zoom_integration_id = zoom_integration_id;
	SET @api_key = api_key;
	SET @api_secret = api_secret;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO global_zoom_integration (ZOOM_INTEGRATION_ID, API_KEY, API_SECRET, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@zoom_integration_id, @api_key, @api_secret, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_zoom_integration(IN zoom_integration_id INT, IN api_key VARCHAR(1000), IN api_secret VARCHAR(1000), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @zoom_integration_id = zoom_integration_id;
	SET @api_key = api_key;
	SET @api_secret = api_secret;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	IF @api_secret IS NULL OR @api_secret = '' THEN
		SET @query = 'UPDATE global_zoom_integration SET API_KEY = @api_key, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';
	ELSE
		SET @query = 'UPDATE global_zoom_integration SET API_KEY = @api_key, API_SECRET = @api_secret, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';
    END IF;	

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_zoom_integration_details(IN zoom_integration_id INT)
BEGIN
	SET @zoom_integration_id = zoom_integration_id;

	SET @query = 'SELECT API_KEY, API_SECRET, TRANSACTION_LOG_ID, RECORD_LOG FROM global_zoom_integration WHERE ZOOM_INTEGRATION_ID = @zoom_integration_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_department_exist(IN department_id VARCHAR(50))
BEGIN
	SET @department_id = department_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_department WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_department(IN department_id VARCHAR(50), IN department VARCHAR(100), IN parent_department VARCHAR(50), IN manager VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @department_id = department_id;
	SET @department = department;
	SET @parent_department = parent_department;
	SET @manager = manager;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_department SET DEPARTMENT = @department, PARENT_DEPARTMENT = @parent_department, MANAGER = @manager, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_department(IN department_id VARCHAR(50), IN department VARCHAR(100), IN parent_department VARCHAR(50), IN manager VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @department_id = department_id;
	SET @department = department;
	SET @parent_department = parent_department;
	SET @manager = manager;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_department (DEPARTMENT_ID, DEPARTMENT, PARENT_DEPARTMENT, MANAGER, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@department_id, @department, @parent_department, @manager, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_department_details(IN department_id VARCHAR(50))
BEGIN
	SET @department_id = department_id;

	SET @query = 'SELECT DEPARTMENT, PARENT_DEPARTMENT, MANAGER, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_department WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_department(IN department_id VARCHAR(50))
BEGIN
	SET @department_id = department_id;

	SET @query = 'DELETE FROM employee_department WHERE DEPARTMENT_ID = @department_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_job_position_exist(IN job_position_id VARCHAR(50))
BEGIN
	SET @job_position_id = job_position_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_job_position WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_job_position(IN job_position_id VARCHAR(50), IN job_position VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @job_position_id = job_position_id;
	SET @job_position = job_position;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_job_position SET JOB_POSITION = @job_position, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_job_position(IN job_position_id VARCHAR(50), IN job_position VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @job_position_id = job_position_id;
	SET @job_position = job_position;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_job_position (JOB_POSITION_ID, JOB_POSITION, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@job_position_id, @job_position, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_job_position_details(IN job_position_id VARCHAR(50))
BEGIN
	SET @job_position_id = job_position_id;

	SET @query = 'SELECT JOB_POSITION, JOB_DESCRIPTION, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_job_position WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_job_position(IN job_position_id VARCHAR(50))
BEGIN
	SET @job_position_id = job_position_id;

	SET @query = 'DELETE FROM employee_job_position WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_job_description(IN job_position_id VARCHAR(50), IN job_description VARCHAR(500), IN record_log VARCHAR(100))
BEGIN
	SET @job_position_id = job_position_id;
	SET @job_description = job_description;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_job_position SET JOB_DESCRIPTION = @job_description, RECORD_LOG = @record_log WHERE JOB_POSITION_ID = @job_position_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_work_location_exist(IN work_location_id VARCHAR(50))
BEGIN
	SET @work_location_id = work_location_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_work_location WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_work_location(IN work_location_id VARCHAR(50), IN work_location VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @work_location_id = work_location_id;
	SET @work_location = work_location;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_work_location SET WORK_LOCATION = @work_location, EMAIL = @email, TELEPHONE = @telephone, MOBILE = @mobile, STREET_1 = @street_1, STREET_2 = @street_2, COUNTRY_ID = @country_id, STATE_ID = @state_id, CITY = @city, ZIP_CODE = @zip_code, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_work_location(IN work_location_id VARCHAR(50), IN work_location VARCHAR(100), IN email VARCHAR(50), IN telephone VARCHAR(20), IN mobile VARCHAR(20), IN street_1 VARCHAR(200), IN street_2 VARCHAR(200), IN country_id INT, IN state_id INT, IN city VARCHAR(100), IN zip_code VARCHAR(10), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @work_location_id = work_location_id;
	SET @work_location = work_location;
	SET @email = email;
	SET @telephone = telephone;
	SET @mobile = mobile;
	SET @street_1 = street_1;
	SET @street_2 = street_2;
	SET @country_id = country_id;
	SET @state_id = state_id;
	SET @city = city;
	SET @zip_code = zip_code;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_work_location (WORK_LOCATION_ID, WORK_LOCATION, EMAIL, TELEPHONE, MOBILE, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@work_location_id, @work_location, @email, @telephone, @mobile, @street_1, @street_2, @country_id, @state_id, @city, @zip_code, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_work_location_details(IN work_location_id VARCHAR(50))
BEGIN
	SET @work_location_id = work_location_id;

	SET @query = 'SELECT WORK_LOCATION, EMAIL, TELEPHONE, MOBILE, STREET_1, STREET_2, COUNTRY_ID, STATE_ID, CITY, ZIP_CODE, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_work_location WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_work_location(IN work_location_id VARCHAR(50))
BEGIN
	SET @work_location_id = work_location_id;

	SET @query = 'DELETE FROM employee_work_location WHERE WORK_LOCATION_ID = @work_location_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_departure_reason_exist(IN departure_reason_id VARCHAR(50))
BEGIN
	SET @departure_reason_id = departure_reason_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_departure_reason WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_departure_reason(IN departure_reason_id VARCHAR(50), IN departure_reason VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @departure_reason_id = departure_reason_id;
	SET @departure_reason = departure_reason;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_departure_reason SET DEPARTURE_REASON = @departure_reason, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_departure_reason(IN departure_reason_id VARCHAR(50), IN departure_reason VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @departure_reason_id = departure_reason_id;
	SET @departure_reason = departure_reason;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_departure_reason (DEPARTURE_REASON_ID, DEPARTURE_REASON, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@departure_reason_id, @departure_reason, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_departure_reason_details(IN departure_reason_id VARCHAR(50))
BEGIN
	SET @departure_reason_id = departure_reason_id;

	SET @query = 'SELECT DEPARTURE_REASON, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_departure_reason WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_departure_reason(IN departure_reason_id VARCHAR(50))
BEGIN
	SET @departure_reason_id = departure_reason_id;

	SET @query = 'DELETE FROM employee_departure_reason WHERE DEPARTURE_REASON_ID = @departure_reason_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE check_employee_type_exist(IN employee_type_id VARCHAR(50))
BEGIN
	SET @employee_type_id = employee_type_id;

	SET @query = 'SELECT COUNT(1) AS TOTAL FROM employee_type WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE update_employee_type(IN employee_type_id VARCHAR(50), IN employee_type VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_type_id = employee_type_id;
	SET @employee_type = employee_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'UPDATE employee_type SET EMPLOYEE_TYPE = @employee_type, TRANSACTION_LOG_ID = @transaction_log_id, RECORD_LOG = @record_log WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE insert_employee_type(IN employee_type_id VARCHAR(50), IN employee_type VARCHAR(100), IN transaction_log_id VARCHAR(100), IN record_log VARCHAR(100))
BEGIN
	SET @employee_type_id = employee_type_id;
	SET @employee_type = employee_type;
	SET @transaction_log_id = transaction_log_id;
	SET @record_log = record_log;

	SET @query = 'INSERT INTO employee_type (EMPLOYEE_TYPE_ID, EMPLOYEE_TYPE, TRANSACTION_LOG_ID, RECORD_LOG) VALUES(@employee_type_id, @employee_type, @transaction_log_id, @record_log)';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE get_employee_type_details(IN employee_type_id VARCHAR(50))
BEGIN
	SET @employee_type_id = employee_type_id;

	SET @query = 'SELECT EMPLOYEE_TYPE, TRANSACTION_LOG_ID, RECORD_LOG FROM employee_type WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE delete_employee_type(IN employee_type_id VARCHAR(50))
BEGIN
	SET @employee_type_id = employee_type_id;

	SET @query = 'DELETE FROM employee_type WHERE EMPLOYEE_TYPE_ID = @employee_type_id';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_work_location_options()
BEGIN
	SET @query = 'SELECT WORK_LOCATION_ID, WORK_LOCATION FROM employee_work_location ORDER BY WORK_LOCATION';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_department_options()
BEGIN
	SET @query = 'SELECT DEPARTMENT_ID, DEPARTMENT FROM employee_department ORDER BY DEPARTMENT';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_job_position_options()
BEGIN
	SET @query = 'SELECT JOB_POSITION_ID, JOB_POSITION FROM employee_job_position ORDER BY JOB_POSITION';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

CREATE PROCEDURE generate_employee_type_options()
BEGIN
	SET @query = 'SELECT EMPLOYEE_TYPE_ID, EMPLOYEE_TYPE FROM employee_type ORDER BY EMPLOYEE_TYPE';

	PREPARE stmt FROM @query;
	EXECUTE stmt;
	DROP PREPARE stmt;
END //

/* Insert Transactions */
INSERT INTO global_user_account (USERNAME, PASSWORD, USER_STATUS, PASSWORD_EXPIRY_DATE, FAILED_LOGIN, LAST_FAILED_LOGIN, TRANSACTION_LOG_ID) VALUES ('ADMIN', '68aff5412f35ed76', 'Active', '2021-12-30', 0, null, 'TL-1');
INSERT INTO global_system_parameters (PARAMETER_ID, PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID) VALUES ('1', 'System Parameter', 'Parameter for system parameters.', '', 3, 'TL-2');
INSERT INTO global_system_parameters (PARAMETER_ID, PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID) VALUES ('2', 'Transaction Log', 'Parameter for transaction logs.', 'TL-', 4, 'TL-3');
INSERT INTO global_system_parameters (PARAMETER_ID, PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID) VALUES ('3', 'Policy', 'Parameter for policies.', '', 0, 'TL-4');
INSERT INTO global_system_parameters (PARAMETER_ID, PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID) VALUES ('4', 'Permissions', 'Parameter for permissions.', '', 0, 'TL-5');
INSERT INTO global_system_parameters (PARAMETER_ID, PARAMETER, PARAMETER_DESCRIPTION, PARAMETER_EXTENSION, PARAMETER_NUMBER, TRANSACTION_LOG_ID) VALUES ('5', 'Role', 'Parameter for role.', 'RL-', 0, 'TL-5');
INSERT INTO global_system_code (SYSTEM_TYPE, SYSTEM_CODE, SYSTEM_DESCRIPTION, TRANSACTION_LOG_ID) VALUES ('SYSTYPE', 'SYSTYPE', 'SYSTEM CODE', '');

INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES ('TL-1', 'ADMIN', 'Insert', '2021-08-01 12:00:00', 'User ADMIN inserted user account.');
INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES ('TL-2', 'ADMIN', 'Insert', '2021-08-01 12:00:00', 'User ADMIN inserted system parameter.');
INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES ('TL-3', 'ADMIN', 'Insert', '2021-08-01 12:00:00', 'User ADMIN inserted system parameter.');
INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES ('TL-4', 'ADMIN', 'Insert', '2021-08-01 12:00:00', 'User ADMIN inserted system parameter.');
INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES ('TL-5', 'ADMIN', 'Insert', '2021-08-01 12:00:00', 'User ADMIN inserted system parameter.');
INSERT INTO global_transaction_log (TRANSACTION_LOG_ID, USERNAME, LOG_TYPE, LOG_DATE, LOG) VALUES ('TL-6', 'ADMIN', 'Insert', '2021-08-01 12:00:00', 'User ADMIN inserted system parameter.');