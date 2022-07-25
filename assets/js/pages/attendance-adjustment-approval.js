(function($) {
    'use strict';

    $(function() {
        if($('#attendance-adjustment-approval-datatable').length){
            initialize_attendance_adjustment_approval_table('#attendance-adjustment-approval-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_attendance_adjustment_approval_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var filter_creation_start_date = $('#filter_creation_start_date').val();
    var filter_creation_end_date = $('#filter_creation_end_date').val();
    var filter_recommendation_start_date = $('#filter_recommendation_start_date').val();
    var filter_recommendation_end_date = $('#filter_recommendation_end_date').val();
    var filter_status = $('#filter_status').val();
    var filter_work_location = $('#filter_work_location').val();
    var filter_department = $('#filter_department').val();
    var type = 'attendance adjustment approval table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'FILE_AS' },
        { 'data' : 'TIME_IN' },
        { 'data' : 'TIME_OUT' },
        { 'data' : 'STATUS' },
        { 'data' : 'SANCTION' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '20%', 'aTargets': 1 },
        { 'width': '15%', 'aTargets': 2 },
        { 'width': '15%', 'aTargets': 3 },
        { 'width': '10%', 'aTargets': 4 },
        { 'width': '10%', 'aTargets': 5 },
        { 'width': '20%','bSortable': false, 'aTargets': 6 }
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
                'data': {'type' : type, 'username' : username, 'filter_creation_start_date' : filter_creation_start_date, 'filter_creation_end_date' : filter_creation_end_date, 'filter_recommendation_start_date' : filter_recommendation_start_date, 'filter_recommendation_end_date' : filter_recommendation_end_date, 'filter_status' : filter_status, 'filter_work_location' : filter_work_location, 'filter_department' : filter_department},
                'dataSrc' : ''
            },
            dom:  "<'row'<'col-sm-3'l><'col-sm-6 text-center mb-2'B><'col-sm-3'f>>" +  "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-5'i><'col-sm-7'p>>",
            buttons: [
                'csv', 'excel', 'pdf'
            ],
            'order': [[ 1, 'desc' ]],
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
                'data': {'type' : type, 'username' : username, 'filter_creation_start_date' : filter_creation_start_date, 'filter_creation_end_date' : filter_creation_end_date, 'filter_recommendation_start_date' : filter_recommendation_start_date, 'filter_recommendation_end_date' : filter_recommendation_end_date, 'filter_status' : filter_status, 'filter_work_location' : filter_work_location, 'filter_department' : filter_department},
                'dataSrc' : ''
            },
            'order': [[ 1, 'desc' ]],
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

    $(document).on('click','.view-attendance-adjustment',function() {
        var adjustment_id = $(this).data('adjustment-id');

        sessionStorage.setItem('adjustment_id', adjustment_id);

        generate_modal('attendance adjustment details', 'Attendance Adjustment Details', 'LG' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','.reject-attendance-adjustment',function() {
        var adjustment_id = $(this).data('adjustment-id');

        sessionStorage.setItem('adjustment_id', adjustment_id);
        
        generate_modal('reject attendance adjustment form', 'Reject Attendance Adjustment', 'R' , '0', '1', 'form', 'reject-attendance-adjustment-form', '1', username);
    });

    $(document).on('click','#reject-attendance-adjustment',function() {
        var adjustment_id = [];

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                adjustment_id.push(this.value);  
            }
        });

        if(adjustment_id.length > 0){
            sessionStorage.setItem('adjustment_id', adjustment_id);
        }

        generate_modal('reject multiple attendance adjustment form', 'Reject Multiple Attendance Adjustment', 'R' , '0', '1', 'form', 'reject-multiple-attendance-adjustment-form', '1', username);
    });

    $(document).on('click','.cancel-attendance-adjustment',function() {
        var adjustment_id = $(this).data('adjustment-id');

        sessionStorage.setItem('adjustment_id', adjustment_id);
        
        generate_modal('cancel attendance adjustment form', 'Cancel Attendance Adjustment', 'R' , '0', '1', 'form', 'cancel-attendance-adjustment-form', '1', username);
    });

    $(document).on('click','#cancel-attendance-adjustment',function() {
        var adjustment_id = [];

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                adjustment_id.push(this.value);  
            }
        });

        if(adjustment_id.length > 0){
            sessionStorage.setItem('adjustment_id', adjustment_id);
        }

        generate_modal('cancel multiple attendance adjustment form', 'Cancel Multiple Attendance Adjustment', 'R' , '0', '1', 'form', 'cancel-multiple-attendance-adjustment-form', '1', username);
    });

    $(document).on('click','.approve-attendance-adjustment',function() {
        var adjustment_id = $(this).data('adjustment-id');

        sessionStorage.setItem('adjustment_id', adjustment_id);
        
        generate_modal('approve attendance adjustment form', 'Approve Attendance Adjustment', 'R' , '0', '1', 'form', 'approve-attendance-adjustment-form', '1', username);
    });

    $(document).on('click','#approve-attendance-adjustment',function() {
        var adjustment_id = [];

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                adjustment_id.push(this.value);  
            }
        });

        if(adjustment_id.length > 0){
            sessionStorage.setItem('adjustment_id', adjustment_id);
        }

        generate_modal('approve multiple attendance adjustment form', 'Approve Multiple Attendance Adjustment', 'R' , '0', '1', 'form', 'approve-multiple-attendance-adjustment-form', '1', username);
    });

    $(document).on('click','#apply-filter',function() {
        initialize_attendance_adjustment_approval_table('#attendance-adjustment-approval-datatable');
    });

}