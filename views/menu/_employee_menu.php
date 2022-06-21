<?php
    $menu = '';

    
    $department_page = $api->check_role_permissions($username, 70);
    $job_position_page = $api->check_role_permissions($username, 75);

    if($department_page > 0 || $job_position_page > 0){
        if($department_page > 0 || $job_position_page > 0){
            $menu .= '<li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle arrow-none" href="javascript: void(0);" id="topnav-configurations" role="button">
                            <span key="t-configurations">Configurations</span> <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-configurations">';

                            if($department_page > 0){
                                $menu .= '<a href="department.php" class="dropdown-item" key="t-department">Department</a>';
                            }

                            if($job_position_page > 0){
                                $menu .= '<a href="job-position.php" class="dropdown-item" key="t-job-position">Job Position</a>';
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