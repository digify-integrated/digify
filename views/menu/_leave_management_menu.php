<?php
    $menu = '';
    
    $public_holiday = $api->check_role_permissions($username, 171);

    if($public_holiday > 0){
        if($public_holiday > 0){
            $menu .= '<li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle arrow-none" href="javascript: void(0);" id="topnav-user-access" role="button">
                            <span key="t-user-access">Configurations</span> <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-user-access">';

                            if($public_holiday > 0){
                                $menu .= '<a href="public-holiday.php" class="dropdown-item" key="t-attendance">Public Holiday</a>';
                            }

                $menu .= '</div>
                    </li>';
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