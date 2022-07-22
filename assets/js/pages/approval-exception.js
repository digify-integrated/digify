(function($) {
    'use strict';

    $(function() {
        if($('#approval-exception-datatable').length){
            initialize_approval_exception_table('#approval-exception-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_approval_exception_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var approval_type_id = $('#approval-type-id').text();
    var type = 'approval exception table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'FILE_AS' },
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
                'data': {'type' : type, 'username' : username, 'approval_type_id' : approval_type_id},
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
                'data': {'type' : type, 'username' : username, 'approval_type_id' : approval_type_id},
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

    $(document).on('click','#add-approval-exception',function() {
        generate_modal('approval exception form', 'Approval Exception', 'R' , '1', '1', 'form', 'approval-exception-form', '1', username);
    });
    
    $(document).on('click','.delete-approval-exception',function() {
        var approval_type_id = $('#approval-type-id').text();
        var employee_id = $(this).data('employee-id'); 
        var transaction = 'delete approval exception';

        Swal.fire({
            title: 'Delete Approval Exception',
            text: 'Are you sure you want to delete this approval exception?',
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
                    data: {username : username, employee_id : employee_id, approval_type_id : approval_type_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Approval Exception', 'The approval exception has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Approval Exception', 'The approval exception does not exist.', 'info');
                            }

                            reload_datatable('#approval-exception-datatable');
                        }
                        else{
                          show_alert('Delete Approval Exception', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-approval-exception',function() {
        var approval_type_id = $('#approval-type-id').text();
        var employee_id = [];
        var transaction = 'delete multiple approval exception';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                employee_id.push(this.value);  
            }
        });

        if(employee_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Approval Exceptions',
                text: 'Are you sure you want to delete these approval exceptions?',
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
                        data: {username : username, employee_id : employee_id, approval_type_id : approval_type_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Approval Exceptions', 'The approval exceptions have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Approval Exceptions', 'The approval exception does not exist.', 'info');
                                }
    
                                reload_datatable('#approval-exception-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Approval Exceptions', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Approval Exceptions', 'Please select the policies you want to delete.', 'error');
        }
    });
}