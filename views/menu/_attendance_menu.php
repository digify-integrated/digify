<?php
    $menu = '';

    
    $attendance_setting_page = $api->check_role_permissions($username, 108);
    $check_in_check_out_page = $api->check_role_permissions($username, 111);

    if($attendance_setting_page > 0 || $check_in_check_out_page > 0){
        if($check_in_check_out_page > 0){
            $menu .= '<li class="nav-item dropdown"><a href="check-in-check-out.php" class="nav-link">Check In / Check Out</a></li>';
        }

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