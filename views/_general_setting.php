<?php

$content = '';
$tab = '';
$tab_content = '';

$view_user_interface_setting = $api->check_role_permissions($username, 61);
$update_user_interface_setting = $api->check_role_permissions($username, 62);

$view_email_setup = $api->check_role_permissions($username, 64);
$update_email_setup = $api->check_role_permissions($username, 65);

$view_application_notification = $api->check_role_permissions($username, 67);
$update_application_notification = $api->check_role_permissions($username, 68);

$view_zoom_integration = $api->check_role_permissions($username, 70);
$update_zoom_integration = $api->check_role_permissions($username, 71);

if($view_user_interface_setting > 0  || $view_email_setup > 0 || $view_application_notification > 0 || $view_zoom_integration > 0){

    if($view_user_interface_setting > 0){
        $tab .= '<a class="nav-link active" id="v-interface-setting-tab" data-bs-toggle="pill" href="#v-interface-setting" role="tab" aria-controls="v-interface-setting" aria-selected="true">
                    <i class= "bx bx-layout d-block check-nav-icon mt-4 mb-2"></i>
                    <p class="fw-bold mb-4">Interface Setting</p>
                </a>';

        $tab_content .= '<div class="tab-pane fade show active" id="v-interface-setting" role="tabpanel" aria-labelledby="v-interface-setting-tab">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1 align-self-center">
                                            <h4 class="card-title">Interface Setting</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="cmxform" id="user-interface-setting-form" method="post" action="#">
                                    <div class="row mb-4">
                                        <label for="login_bg" class="col-sm-3 col-form-label">Login Background</label>
                                        <div class="col-sm-9">
                                            <img class="rounded mr-2 mb-4" alt="login bg" width="150" src="./assets/images/default/default-bg.jpg" id="login-bg" data-holder-rendered="true">
                                            <input class="form-control" type="file" name="login_bg" id="login_bg">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label for="login_logo" class="col-sm-3 col-form-label">Login Logo</label>
                                        <div class="col-sm-9">
                                            <img class="rounded mr-2 mb-4" alt="logo-light" width="150" src="./assets/images/default/default-logo-light-horizontal.png" id="login-logo" data-holder-rendered="true">
                                            <input class="form-control" type="file" name="login_logo" id="login_logo">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label for="menu_logo" class="col-sm-3 col-form-label">Menu Logo</label>
                                        <div class="col-sm-9">
                                            <img class="rounded mr-2 mb-4" alt="logo dark" width="150" src="./assets/images/default/default-logo-dark-horizontal.png" id="menu-logo" data-holder-rendered="true">
                                            <input class="form-control" type="file" name="menu_logo" id="menu_logo">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label for="menu_icon" class="col-sm-3 col-form-label">Menu Icon</label>
                                        <div class="col-sm-9">
                                            <img class="rounded mr-2 mb-4" alt="logo icon light" width="150" src="./assets/images/default/default-logo-icon-light.png" id="menu-icon" data-holder-rendered="true">
                                            <input class="form-control" type="file" name="menu_icon" id="menu_icon">
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <label for="favicon_image" class="col-sm-3 col-form-label">Favicon Image</label>
                                        <div class="col-sm-9">
                                            <img class="rounded mr-2 mb-4" alt="favicon image" width="150" src="./assets/images/default/default-logo-icon-light.png" id="favicon-image" data-holder-rendered="true">
                                            <input class="form-control" type="file" name="favicon_image" id="favicon_image">
                                        </div>
                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col-sm-9">
                                            <div>
                                                <button type="submit" class="btn btn-primary w-md">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>';
    }

    if($view_email_setup > 0){
        $tab .= '<a class="nav-link" id="v-email-setup-tab" data-bs-toggle="pill" href="#v-email-setup" role="tab" aria-controls="v-email-setup" aria-selected="true">
                    <i class= "bx bx-envelope d-block check-nav-icon mt-4 mb-2"></i>
                    <p class="fw-bold mb-4">Email Setup</p>
                </a>';

        $tab_content .= '<div class="tab-pane fade" id="v-email-setup" role="tabpanel" aria-labelledby="v-email-setup-tab">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1 align-self-center">
                                            <h4 class="card-title">Email Setup</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="cmxform" id="email-setup-form" method="post" action="#">
                                        <div class="row mb-4">
                                            <label for="mail_host" class="col-sm-3 col-form-label">Mail Host <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control form-maxlength" autocomplete="off" id="mail_host" name="mail_host" maxlength="100">
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="port" class="col-sm-3 col-form-label">Mail Port <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input id="port" name="port" class="form-control" type="number" min="0">
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="mail_user" class="col-sm-3 col-form-label">Mail Username <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control form-maxlength" autocomplete="off" id="mail_user" name="mail_user" maxlength="200">
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="mail_password" class="col-sm-3 col-form-label">Mail Password</label>
                                            <div class="col-sm-9">
                                                <div class="input-group auth-pass-inputgroup">
                                                    <input type="password" id="mail_password" name="mail_password" class="form-control" aria-label="Password" aria-describedby="password-addon">
                                                    <button class="btn btn-light " type="button" id="password-addon"><i class="mdi mdi-eye-outline"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="mail_encryption" class="col-sm-3 col-form-label">Mail Encryption <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="input-group auth-pass-inputgroup">
                                                    <select class="form-control form-select2" id="mail_encryption" name="mail_encryption">
                                                        <option value="">--</option>
                                                        '. $api->generate_system_code_options('MAILENCRYPTION') .'
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="smtp_auth" class="col-sm-3 col-form-label">SMTP Authentication</label>
                                            <div class="col-sm-9">
                                                <div class="input-group auth-pass-inputgroup">
                                                    <select class="form-control form-select2" id="smtp_auth" name="smtp_auth">
                                                        <option value="1">True</option>
                                                        <option value="0">False</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="smtp_auto_tls" class="col-sm-3 col-form-label">SMTP Auto TLS</label>
                                            <div class="col-sm-9">
                                                <div class="input-group auth-pass-inputgroup">
                                                    <select class="form-control form-select2" id="smtp_auto_tls" name="smtp_auto_tls">
                                                        <option value="1">True</option>
                                                        <option value="0">False</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="mail_from_name" class="col-sm-3 col-form-label">Mail From Name <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="input-group auth-pass-inputgroup">
                                                    <input type="text" class="form-control form-maxlength" autocomplete="off" id="mail_from_name" name="mail_from_name" maxlength="200">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="mail_from_email" class="col-sm-3 col-form-label">Mail From Email <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="input-group auth-pass-inputgroup">
                                                <input class="form-control email-inputmask form-maxlength" autocomplete="off" id="mail_from_email" name="mail_from_email" maxlength="200">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-end">
                                            <div class="col-sm-9">
                                                <div>
                                                    <button type="submit" class="btn btn-primary w-md">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>';
    }

    if($view_application_notification > 0){
        $tab .= '<a class="nav-link" id="v-application-notification-tab" data-bs-toggle="pill" href="#v-application-notification" role="tab" aria-controls="v-application-notification" aria-selected="true">
                    <i class= "bx bx-bell d-block check-nav-icon mt-4 mb-2"></i>
                    <p class="fw-bold mb-4">Application Notification</p>
                </a>';

        $tab_content .= '<div class="tab-pane fade" id="v-application-notification" role="tabpanel" aria-labelledby="v-application-notification-tab">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1 align-self-center">
                                            <h4 class="card-title">Application Notification</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                </div>
                            </div>
                        </div>';
    }

    if($view_zoom_integration > 0){
        $tab .= '<a class="nav-link" id="v-zoom-integration-tab" data-bs-toggle="pill" href="#v-zoom-integration" role="tab" aria-controls="v-zoom-integration" aria-selected="true">
                    <i class= "bx bx-video d-block check-nav-icon mt-4 mb-2"></i>
                    <p class="fw-bold mb-4">Zoom Integration</p>
                </a>';

        $tab_content .= '<div class="tab-pane fade" id="v-zoom-integration" role="tabpanel" aria-labelledby="v-zoom-integration-tab">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1 align-self-center">
                                            <h4 class="card-title">Zoom Integration</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="cmxform" id="email-setup-form" method="post" action="#">
                                        <div class="row mb-4">
                                            <label for="api_key" class="col-sm-3 col-form-label">API Key <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control form-maxlength" autocomplete="off" id="api_key" name="api_key" maxlength="1000">
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <label for="api_secret" class="col-sm-3 col-form-label">API Secret <span class="text-danger">*</span></label>
                                            <div class="col-sm-9">
                                                <div class="input-group auth-pass-inputgroup">
                                                    <input type="password" id="api_secret" name="api_secret" class="form-control form-maxlength" aria-label="API Key" aria-describedby="form-password-addon" maxlength="1000">
                                                    <button class="btn btn-light" type="button" id="form-password-addon"><i class="mdi mdi-eye-outline"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-end">
                                            <div class="col-sm-9">
                                                <div>
                                                    <button type="submit" class="btn btn-primary w-md">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>';
    }

    $content .= '<div class="checkout-tabs">
                    <div class="row">
                        <div class="col-xl-2 col-sm-3">
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                '. $tab .'
                                
                            </div>
                        </div>
                        <div class="col-xl-10 col-sm-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        '. $tab_content .'
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>';
}


echo $content;


?>