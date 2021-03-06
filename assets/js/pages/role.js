(function($) {
    'use strict';

    $(function() {
        if($('#role-datatable').length){
            initialize_role_table('#role-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_role_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'role table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'ROLE' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '79%', 'aTargets': 1 },
        { 'width': '20%','bSortable': false, 'aTargets': 2 },
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

    $(document).on('click','#add-role',function() {
        generate_modal('role form', 'Role', 'R' , '1', '1', 'form', 'role-form', '1', username);
    });

    $(document).on('click','.update-role',function() {
        var role_id = $(this).data('role-id');

        sessionStorage.setItem('role_id', role_id);
        
        generate_modal('role form', 'Role', 'R' , '1', '1', 'form', 'role-form', '0', username);
    });

    $(document).on('click','.update-role-permission',function() {
        var role_id = $(this).data('role-id');

        sessionStorage.setItem('role_id', role_id);
        
        generate_modal('role permission form', 'Role Permission', 'LG' , '1', '1', 'form', 'role-permission-form', '0', username);
    });

    $(document).on('click','.assign-permission-role',function() {
        var role_id = $(this).data('role-id');
        
        sessionStorage.setItem('role_id', role_id);

        generate_modal('permission role form', 'Permission Assignment', 'XL' , '1', '1', 'form', 'permission-role-form', '0', username);
    });
    
    $(document).on('click','.delete-role',function() {
        var role_id = $(this).data('role-id');
        var transaction = 'delete role';

        Swal.fire({
            title: 'Delete Role',
            text: 'Are you sure you want to delete this role?',
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
                    data: {username : username, role_id : role_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Role', 'The role has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Role', 'The role does not exist.', 'info');
                            }

                            reload_datatable('#role-datatable');
                        }
                        else{
                          show_alert('Delete Role', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-role',function() {
        var role_id = [];
        var transaction = 'delete multiple role';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                role_id.push(this.value);  
            }
        });

        if(role_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Roles',
                text: 'Are you sure you want to delete these roles?',
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
                        data: {username : username, role_id : role_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Roles', 'The roles have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Roles', 'The roles does not exist.', 'info');
                                }
    
                                reload_datatable('#role-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Roles', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Roles', 'Please select the roles you want to delete.', 'error');
        }
    });

}