DELIMITER //

/* Get Stored Procedure */

DROP PROCEDURE IF EXISTS getAppModule//
CREATE PROCEDURE getAppModule(
    IN p_app_module_id INT
)
BEGIN
	SELECT * FROM app_module
	WHERE app_module_id = p_app_module_id;
END //

/* ----------------------------------------------------------------------------------------------------------------------------- */