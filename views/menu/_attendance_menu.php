<?php
    $menu = '';

    
    $attendance_setting_page = $api->check_role_permissions($username, 108);

    if($attendance_setting_page > 0 ){
        if($attendance_setting_page > 0){
            $menu .= '<li class="nav-item dropdown"><a href="attendance-setting.php" class="nav-link">Attendance Setting</a></li>';
        }
    }
?>


<div class="topnav">
            <div class="container-fluid">
                <nav class="navbar navbar-light navbar-expand-lg topnav-menu">

                    <div class="collapse navbar-collapse" id="topnav-menu-content">
                        <ul class="navbar-nav">
                            <?php echo $menu; ?>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>