(function($) {
    'use strict';

    $(function() {
        if($('#attendance-datatable').length){
            initialize_attendance_table('#attendance-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_attendance_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var filter_start_date = $('#filter_start_date').val();
    var filter_end_date = $('#filter_end_date').val();
    var filter_work_location = $('#filter_work_location').val();
    var filter_department = $('#filter_department').val();
    var filter_job_position = $('#filter_job_position').val();
    var filter_employee_type = $('#filter_employee_type').val();
    var filter_time_in_behavior = $('#filter_time_in_behavior').val();
    var filter_time_out_behavior = $('#filter_time_out_behavior').val();
    var type = 'attendance table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'FILE_AS' },
        { 'data' : 'TIME_IN' },
        { 'data' : 'TIME_IN_BEHAVIOR' },
        { 'data' : 'TIME_OUT' },
        { 'data' : 'TIME_OUT_BEHAVIOR' },
        { 'data' : 'LATE' },
        { 'data' : 'EARLY_LEAVING' },
        { 'data' : 'OVERTIME' },
        { 'data' : 'TOTAL_WORKING_HOURS' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '24%', 'aTargets': 1 },
        { 'width': '10%', 'aTargets': 2 },
        { 'width': '10%', 'aTargets': 3 },
        { 'width': '10%', 'aTargets': 4 },
        { 'width': '10%', 'aTargets': 5 },
        { 'width': '10%', 'aTargets': 6 },
        { 'width': '10%', 'aTargets': 7 },
        { 'width': '10%', 'aTargets': 8 },
        { 'width': '10%', 'aTargets': 9 },
        { 'width': '20%','bSortable': false, 'aTargets': 10}
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
                'data': {'type' : type, 'username' : username, 'filter_start_date' : filter_start_date, 'filter_end_date' : filter_end_date, 'filter_work_location' : filter_work_location, 'filter_department' : filter_department, 'filter_job_position' : filter_job_position, 'filter_employee_type' : filter_employee_type, 'filter_time_in_behavior' : filter_time_in_behavior, 'filter_time_out_behavior' : filter_time_out_behavior},
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
                'data': {'type' : type, 'username' : username, 'filter_start_date' : filter_start_date, 'filter_end_date' : filter_end_date, 'filter_work_location' : filter_work_location, 'filter_department' : filter_department, 'filter_job_position' : filter_job_position, 'filter_employee_type' : filter_employee_type, 'filter_time_in_behavior' : filter_time_in_behavior, 'filter_time_out_behavior' : filter_time_out_behavior},
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

    $(document).on('click','.view-attendance',function() {
        var attendance_id = $(this).data('attendance-id');

        sessionStorage.setItem('attendance_id', attendance_id);

        generate_modal('attendance details', 'Attendance Details', 'XL' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','#add-attendance',function() {
        generate_modal('attendance form', 'Attendance', 'R' , '0', '1', 'form', 'attendance-form', '1', username);
    });

    $(document).on('click','.update-attendance',function() {
        var attendance_id = $(this).data('attendance-id');

        sessionStorage.setItem('attendance_id', attendance_id);
        
        generate_modal('attendance form', 'Attendance', 'R' , '0', '1', 'form', 'attendance-form', '0', username);
    });
    
    $(document).on('click','.delete-attendance',function() {
        var attendance_id = $(this).data('attendance-id');
        var transaction = 'delete attendance';

        Swal.fire({
            title: 'Delete Attendance',
            text: 'Are you sure you want to delete this attendance?',
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
                    data: {username : username, attendance_id : attendance_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted'){
                          show_alert('Delete Attendance', 'The attendance has been deleted.', 'success');

                          reload_datatable('#attendance-datatable');
                        }
                        else if(response === 'Not Found'){
                          show_alert('Delete Attendance', 'The attendance does not exist.', 'info');
                        }
                        else{
                          show_alert('Delete Attendance', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-attendance',function() {
        var attendance_id = [];
        var transaction = 'delete multiple attendance';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                attendance_id.push(this.value);  
            }
        });

        if(attendance_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Attendances',
                text: 'Are you sure you want to delete these attendances?',
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
                        data: {username : username, attendance_id : attendance_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted'){
                                show_alert('Delete Multiple Attendances', 'The attendances have been deleted.', 'success');
    
                                reload_datatable('#attendance-datatable');
                            }
                            else if(response === 'Not Found'){
                                show_alert('Delete Multiple Attendances', 'The attendances does not exist.', 'info');
                            }
                            else{
                                show_alert('Delete Multiple Attendances', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Attendances', 'Please select the attendances you want to delete.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_attendance_table('#attendance-datatable');
    });

}