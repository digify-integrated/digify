(function($) {
    'use strict';

    $(function() {
        if($('#employee-type-datatable').length){
            initialize_employee_type_table('#employee-type-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_employee_type_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'employee type table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'EMPLOYEE_TYPE' },
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

    $(document).on('click','#add-employee-type',function() {
        generate_modal('employee type form', 'Employee Type', 'R' , '1', '1', 'form', 'employee-type-form', '1', username);
    });

    $(document).on('click','.update-employee-type',function() {
        var employee_type_id = $(this).data('employee-type-id');

        sessionStorage.setItem('employee_type_id', employee_type_id);
        
        generate_modal('employee type form', 'Employee Type', 'R' , '1', '1', 'form', 'employee-type-form', '0', username);
    });
    
    $(document).on('click','.delete-employee-type',function() {
        var employee_type_id = $(this).data('employee-type-id');
        var transaction = 'delete employee type';

        Swal.fire({
            title: 'Delete Employee Type',
            text: 'Are you sure you want to delete this employee type?',
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
                    data: {username : username, employee_type_id : employee_type_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted'){
                          show_alert('Delete Employee Type', 'The employee type has been deleted.', 'success');

                          reload_datatable('#employee-type-datatable');
                        }
                        else if(response === 'Not Found'){
                          show_alert('Delete Employee Type', 'The employee type does not exist.', 'info');
                        }
                        else{
                          show_alert('Delete Employee Type', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-employee-type',function() {
        var employee_type_id = [];
        var transaction = 'delete multiple employee type';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                employee_type_id.push(this.value);  
            }
        });

        if(employee_type_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Employee Types',
                text: 'Are you sure you want to delete these employee types?',
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
                        data: {username : username, employee_type_id : employee_type_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted'){
                                show_alert('Delete Multiple Employee Types', 'The employee types have been deleted.', 'success');
    
                                reload_datatable('#employee-type-datatable');
                            }
                            else if(response === 'Not Found'){
                                show_alert('Delete Multiple Employee Types', 'The employee type does not exist.', 'info');
                            }
                            else{
                                show_alert('Delete Multiple Employee Types', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Employee Types', 'Please select the employee types you want to delete.', 'error');
        }
    });

}