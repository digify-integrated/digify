<?php
    $menu = '';

    
    $approval_type_page = $api->check_role_permissions($username, 136);
    $attendance_adjustment_recommendation_page = $api->check_role_permissions($username, 149);
    $attendance_creation_recommendation_page = $api->check_role_permissions($username, 154);

    if($approval_type_page > 0 || $attendance_adjustment_recommendation_page > 0 || $attendance_creation_recommendation_page > 0){
        if($attendance_adjustment_recommendation_page > 0 || $attendance_creation_recommendation_page > 0){
            $menu .= '<li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle arrow-none" href="javascript: void(0);" id="topnav-recommendation" role="button">
                            <span key="t-recommendation">Recommendations</span> <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-recommendation">';

                            if($attendance_adjustment_recommendation_page > 0){
                                $menu .= '<a href="attendance-adjustment-recommendation.php" class="dropdown-item" key="t-attendance-adjustment-recommendation">Attendance Adjustment</a>';
                            }

                            if($attendance_creation_recommendation_page > 0){
                                $menu .= '<a href="attendance-creation-recommendation.php" class="dropdown-item" key="t-attendance-creation-recommendation">Attendance Creation</a>';
                            }

                $menu .= '</div>
                    </li>';
        }

        if($approval_type_page > 0){
            $menu .= '<li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle arrow-none" href="javascript: void(0);" id="topnav-configurations" role="button">
                            <span key="t-configurations">Configurations</span> <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-configurations">';

                            if($approval_type_page > 0){
                                $menu .= '<a href="approval-type.php" class="dropdown-item" key="t-approval-type">Approval Type</a>';
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