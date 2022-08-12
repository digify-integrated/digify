(function($) {
    'use strict';

    $(function() {
        if($('#leave-allocation-datatable').length){
            initialize_leave_allocation_table('#leave-allocation-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_leave_allocation_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'leave allocation table';
    var filter_start_date = $('#filter_start_date').val();
    var filter_end_date = $('#filter_end_date').val();
    var filter_leave_type = $('#filter_leave_type').val();
    var filter_work_location = $('#filter_work_location').val();
    var filter_department = $('#filter_department').val();
    var filter_job_position = $('#filter_job_position').val();
    var filter_employee_type = $('#filter_employee_type').val();
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'FILE_AS' },
        { 'data' : 'LEAVE_TYPE' },
        { 'data' : 'VALIDITY' },
        { 'data' : 'DURATION' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '25%', 'aTargets': 1 },
        { 'width': '15%', 'aTargets': 2 },
        { 'width': '17%', 'aTargets': 3 },
        { 'width': '18%', 'aTargets': 4 },
        { 'width': '20%','bSortable': false, 'aTargets': 5 },
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
                'data': {'type' : type, 'username' : username, 'filter_start_date' : filter_start_date, 'filter_end_date' : filter_end_date, 'filter_leave_type' : filter_leave_type, 'filter_work_location' : filter_work_location, 'filter_department' :filter_department, 'filter_job_position' :filter_job_position, 'filter_employee_type' :filter_employee_type},
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
                'data': {'type' : type, 'username' : username, 'filter_start_date' : filter_start_date, 'filter_end_date' : filter_end_date, 'filter_leave_type' : filter_leave_type, 'filter_work_location' : filter_work_location, 'filter_department' :filter_department, 'filter_job_position' :filter_job_position, 'filter_employee_type' :filter_employee_type},
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

    $(document).on('click','.view-leave-allocation',function() {
        var leave_allocation_id = $(this).data('leave-allocation-id');

        sessionStorage.setItem('leave_allocation_id', leave_allocation_id);

        generate_modal('leave allocation details', 'Leave Allocation Details', 'LG' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','#add-leave-allocation',function() {
        generate_modal('leave allocation form', 'Leave Allocation', 'R' , '0', '1', 'form', 'leave-allocation-form', '1', username);
    });

    $(document).on('click','.update-leave-allocation',function() {
        var leave_allocation_id = $(this).data('leave-allocation-id');

        sessionStorage.setItem('leave_allocation_id', leave_allocation_id);
        
        generate_modal('leave allocation form', 'Leave Allocation', 'R' , '0', '1', 'form', 'leave-allocation-form', '0', username);
    });
    
    $(document).on('click','.delete-leave-allocation',function() {
        var leave_allocation_id = $(this).data('leave-allocation-id');
        var transaction = 'delete leave allocation';

        Swal.fire({
            title: 'Delete Leave Allocation',
            text: 'Are you sure you want to delete this leave allocation?',
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
                    data: {username : username, leave_allocation_id : leave_allocation_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Leave Allocation', 'The leave allocation has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Leave Allocation', 'The leave allocation does not exist.', 'info');
                            }

                            reload_datatable('#leave-allocation-datatable');
                        }
                        else{
                          show_alert('Delete Leave Allocation', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-leave-allocation',function() {
        var leave_allocation_id = [];
        var transaction = 'delete multiple leave allocation';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                leave_allocation_id.push(this.value);  
            }
        });

        if(leave_allocation_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Leave Allocations',
                text: 'Are you sure you want to delete these leave allocations?',
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
                        data: {username : username, leave_allocation_id : leave_allocation_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Leave Allocations', 'The leave allocations have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Leave Allocations', 'The leave allocations does not exist.', 'info');
                                }
    
                                reload_datatable('#leave-allocation-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Leave Allocations', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Leave Allocations', 'Please select the leave allocations you want to delete.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_leave_allocation_table('#leave-allocation-datatable');
    });

}