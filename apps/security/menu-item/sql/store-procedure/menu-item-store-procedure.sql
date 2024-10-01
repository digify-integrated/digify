/* Get Stored Procedure */

DROP PROCEDURE IF EXISTS getMenuItem//
CREATE PROCEDURE getMenuItem(
    IN p_menu_item_id INT
)
BEGIN
	SELECT * FROM menu_item
	WHERE menu_item_id = p_menu_item_id;
END //

/* ----------------------------------------------------------------------------------------------------------------------------- */

/* Generate Stored Procedure */

DROP PROCEDURE IF EXISTS generateMenuItemOptions//
CREATE PROCEDURE generateMenuItemOptions(IN p_menu_item_id INT)
BEGIN
    IF p_menu_item_id IS NOT NULL AND p_menu_item_id != '' THEN
        SELECT menu_item_id, menu_item_name 
        FROM menu_item 
        WHERE menu_item_id != p_menu_item_id
        ORDER BY menu_item_name;
    ELSE
        SELECT menu_item_id, menu_item_name 
        FROM menu_item 
        ORDER BY menu_item_name;
    END IF;
END //

/* ----------------------------------------------------------------------------------------------------------------------------- */