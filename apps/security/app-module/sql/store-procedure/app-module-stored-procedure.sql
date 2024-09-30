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


DROP PROCEDURE IF EXISTS generateAppModuleTable//
CREATE PROCEDURE generateAppModuleTable()
BEGIN
	SELECT app_module_id, app_module_name, app_module_description, app_logo, order_sequence 
    FROM app_module 
    ORDER BY app_module_id;
END //