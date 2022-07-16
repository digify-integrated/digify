(function($) {
    'use strict';

    $(function() {
        if($('#notification-setting-datatable').length){
            initialize_notification_setting_table('#notification-setting-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_notification_setting_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'notification setting table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'NOTIFICATION_SETTING_ID' },
        { 'data' : 'NOTIFICATION_SETTING' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '15%', 'aTargets': 1 },
        { 'width': '64%', 'aTargets': 2 },
        { 'width': '20%','bSortable': false, 'aTargets': 3 },
    ];

    if(show_all){
        length_menu = [ [-1], ['All'] ];
    }
    else{
        length_menu = [ [10, 25, 50, 100, -1], [10, 25, 50, 100, 'All'] ];
    }

    if(buttons){
        settings = {
            'ajax': { 
                'url' : 'system-generation.php',
                'method' : 'POST',
                'dataType': 'JSON',
                'data': {'type' : type, 'username' : username},
                'dataSrc' : ''
            },
            dom:  "<'row'<'col-sm-3'l><'col-sm-6 text-center mb-2'B><'col-sm-3'f>>" +  "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-5'i><'col-sm-7'p>>",
            buttons: [
                'csv', 'excel', 'pdf'
            ],
            'order': [[ 1, 'asc' ]],
            'columns' : column,
            'scrollY': false,
            'scrollX': true,
            'scrollCollapse': true,
            'fnDrawCallback': function( oSettings ) {
                readjust_datatable_column();
            },
            'aoColumnDefs': column_definition,
            'lengthMenu': length_menu,
            'language': {
                'emptyTable': 'No data found',
                'searchPlaceholder': 'Search...',
                'search': '',
                'loadingRecords': '<div class="spinner-border spinner-border-lg text-info" role="status"><span class="sr-only">Loading...</span></div>'
            }
        };
    }
    else{
        settings = {
            'ajax': { 
                'url' : 'system-generation.php',
                'method' : 'POST',
                'dataType': 'JSON',
                'data': {'type' : type, 'username' : username},
                'dataSrc' : ''
            },
            'order': [[ 1, 'asc' ]],
            'columns' : column,
            'scrollY': false,
            'scrollX': true,
            'scrollCollapse': true,
            'fnDrawCallback': function( oSettings ) {
                readjust_datatable_column();
            },
            'aoColumnDefs': column_definition,
            'lengthMenu': length_menu,
            'language': {
                'emptyTable': 'No data found',
                'searchPlaceholder': 'Search...',
                'search': '',
                'loadingRecords': '<div class="spinner-border spinner-border-lg text-info" role="status"><span class="sr-only">Loading...</span></div>'
            }
        };
    }

    destroy_datatable(datatable_name);
    
    $(datatable_name).dataTable(settings);
}

function initialize_click_events(){
    var username = $('#username').text();

    $(document).on('click','#add-notification-setting',function() {
        generate_modal('notification setting form', 'Notification Setting', 'R' , '1', '1', 'form', 'notification-setting-form', '1', username);
    });

    $(document).on('click','.update-notification-setting',function() {
        var notification_setting_id = $(this).data('notification-setting-id');

        sessionStorage.setItem('notification_setting_id', notification_setting_id);
        
        generate_modal('notification setting form', 'Notification Setting', 'R' , '1', '1', 'form', 'notification-setting-form', '0', username);
    });

    $(document).on('click','.update-notification-template',function() {
        var notification_setting_id = $(this).data('notification-setting-id');

        sessionStorage.setItem('notification_setting_id', notification_setting_id);
        
        generate_modal('notification template form', 'Notification Template', 'XL' , '1', '1', 'form', 'notification-template-form', '0', username);
    });
    
    $(document).on('click','.delete-notification-setting',function() {
        var notification_setting_id = $(this).data('notification-setting-id');
        var transaction = 'delete notification setting';

        Swal.fire({
            title: 'Delete Notification Setting',
            text: 'Are you sure you want to delete this notification setting?',
            icon: 'warning',
            showCancelButton: !0,
            confirmButtonText: 'Delete',
            cancelButtonText: 'Cancel',
            confirmButtonClass: 'btn btn-danger mt-2',
            cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
            buttonsStyling: !1
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: {username : username, notification_setting_id : notification_setting_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Notification Setting', 'The notification setting has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Notification Setting', 'The notification setting does not exist.', 'info');
                            }

                            reload_datatable('#notification-setting-datatable');
                        }
                        else{
                          show_alert('Delete Notification Setting', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-notification-setting',function() {
        var notification_setting_id = [];
        var transaction = 'delete multiple notification setting';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                notification_setting_id.push(this.value);  
            }
        });

        if(notification_setting_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Notification Settings',
                text: 'Are you sure you want to delete these notification settings?',
                icon: 'warning',
                showCancelButton: !0,
                confirmButtonText: 'Delete',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-danger mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, notification_setting_id : notification_setting_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Notification Settings', 'The notification settings have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Notification Settings', 'The notification setting does not exist.', 'info');
                                }
    
                                reload_datatable('#notification-setting-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Notification Settings', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Notification Settings', 'Please select the notification settings you want to delete.', 'error');
        }
    });

}