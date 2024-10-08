/* Menu Item Table */

DROP TABLE IF EXISTS menu_item;
CREATE TABLE menu_item (
    menu_item_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    menu_item_name VARCHAR(100) NOT NULL,
    menu_item_url VARCHAR(50),
	menu_item_icon VARCHAR(50),
    menu_group_id INT UNSIGNED NOT NULL,
    menu_group_name VARCHAR(100) NOT NULL,
    app_module_id INT UNSIGNED NOT NULL,
    app_module_name VARCHAR(100) NOT NULL,
	parent_id INT UNSIGNED,
    parent_name VARCHAR(100),
    order_sequence TINYINT(10) NOT NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_log_by INT UNSIGNED DEFAULT 1,
    FOREIGN KEY (last_log_by) REFERENCES user_account(user_account_id),
    FOREIGN KEY (menu_group_id) REFERENCES menu_group(menu_group_id),
    FOREIGN KEY (app_module_id) REFERENCES app_module(app_module_id)
);

CREATE INDEX menu_item_index_menu_item_id ON menu_item(menu_item_id);
CREATE INDEX menu_item_index_app_module_id ON menu_item(app_module_id);

INSERT INTO menu_item (menu_item_id, menu_item_name, menu_item_url, menu_item_icon, menu_group_id, menu_group_name, app_module_id, app_module_name, parent_id, parent_name, order_sequence, last_log_by) VALUES
(1, 'App Module', 'app-module.php', 'ti ti-box', 1, 'Technical', 1, 'Settings', 0, '', 1, 2),
(2, 'General Settings', 'general-settings.php', 'ti ti-settings', 1, 'Technical', 1, 'Settings', 0, '', 7, 2),
(3, 'Users & Companies', '', 'ti ti-users', 2, 'Administration', 1, 'Settings', 0, '', 21, 2),
(4, 'User Account', 'user-account.php', '', 2, 'Administration', 1, 'Settings', 3, 'Users & Companies', 21, 2),
(5, 'Company', 'company.php', '', 2, 'Administration', 1, 'Settings', 3, 'Users & Companies', 3, 2),
(6, 'Role', 'role.php', 'ti ti-sitemap', 2, 'Administration', 1, 'Settings', NULL, NULL, 3, 2),
(7, 'User Interface', '', 'ti ti-layout-sidebar', 1, 'Technical', 1, 'Settings', NULL, NULL, 16, 2),
(8, 'Menu Group', 'menu-group.php', '', 1, 'Technical', 1, 'Settings', 7, 'User Interface', 1, 2),
(9, 'Menu Item', 'menu-item.php', '', 1, 'Technical', 1, 'Settings', 7, 'User Interface', 2, 2),
(10, 'System Action', 'system-action.php', '', 1, 'Technical', 1, 'Settings', 7, 'User Interface', 2, 2);

/* ----------------------------------------------------------------------------------------------------------------------------- */