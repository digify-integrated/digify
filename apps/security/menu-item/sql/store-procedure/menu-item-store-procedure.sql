/* Get Stored Procedure */

CREATE PROCEDURE getMenuItem(
    IN p_menu_item_id INT
)
BEGIN
	SELECT * FROM menu_item
	WHERE menu_item_id = p_menu_item_id;
END //

/* ----------------------------------------------------------------------------------------------------------------------------- */