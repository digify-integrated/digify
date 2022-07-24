(function($) {
    'use strict';

    $(function() {
        if($('#attendance-creation-recommendation-datatable').length){
            initialize_attendance_creation_recommendation_table('#attendance-creation-recommendation-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_attendance_creation_recommendation_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var filter_for_recommendation_start_date = $('#filter_for_recommendation_start_date').val();
    var filter_for_recommendation_end_date = $('#filter_for_recommendation_end_date').val();
    var filter_work_location = $('#filter_work_location').val();
    var filter_department = $('#filter_department').val();
    var type = 'attendance creation recommendation table';
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
                'data': {'type' : type, 'username' : username, 'filter_for_recommendation_start_date' : filter_for_recommendation_start_date, 'filter_for_recommendation_end_date' : filter_for_recommendation_end_date, 'filter_work_location' : filter_work_location, 'filter_department' : filter_department},
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
                'data': {'type' : type, 'username' : username, 'filter_for_recommendation_start_date' : filter_for_recommendation_start_date, 'filter_for_recommendation_end_date' : filter_for_recommendation_end_date, 'filter_work_location' : filter_work_location, 'filter_department' : filter_department},
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

    $(document).on('click','.view-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');

        sessionStorage.setItem('creation_id', creation_id);

        generate_modal('attendance creation details', 'Attendance Creation Details', 'LG' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','.reject-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');

        sessionStorage.setItem('creation_id', creation_id);
        
        generate_modal('reject attendance creation form', 'Reject Attendance Creation', 'R' , '0', '1', 'form', 'reject-attendance-creation-form', '1', username);
    });

    $(document).on('click','#reject-attendance-creation',function() {
        var creation_id = [];

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                creation_id.push(this.value);  
            }
        });

        if(creation_id.length > 0){
            sessionStorage.setItem('creation_id', creation_id);
        }

        generate_modal('reject multiple attendance creation form', 'Reject Multiple Attendance Creation', 'R' , '0', '1', 'form', 'reject-multiple-attendance-creation-form', '1', username);
    });

    $(document).on('click','.cancel-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');

        sessionStorage.setItem('creation_id', creation_id);
        
        generate_modal('cancel attendance creation form', 'Cancel Attendance Creation', 'R' , '0', '1', 'form', 'cancel-attendance-creation-form', '1', username);
    });

    $(document).on('click','#cancel-attendance-creation',function() {
        var creation_id = [];

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                creation_id.push(this.value);  
            }
        });

        if(creation_id.length > 0){
            sessionStorage.setItem('creation_id', creation_id);
        }

        generate_modal('cancel multiple attendance creation form', 'Cancel Multiple Attendance Creation', 'R' , '0', '1', 'form', 'cancel-multiple-attendance-creation-form', '1', username);
    });

    $(document).on('click','.recommend-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');

        sessionStorage.setItem('creation_id', creation_id);
        
        generate_modal('recommend attendance creation form', 'Recommend Attendance Creation', 'R' , '0', '1', 'form', 'recommend-attendance-creation-form', '1', username);
    });

    $(document).on('click','#recommend-attendance-creation',function() {
        var creation_id = [];

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                creation_id.push(this.value);  
            }
        });

        if(creation_id.length > 0){
            sessionStorage.setItem('creation_id', creation_id);
        }

        generate_modal('recommend multiple attendance creation form', 'Recommend Multiple Attendance Creation', 'R' , '0', '1', 'form', 'recommend-multiple-attendance-creation-form', '1', username);
    });

    $(document).on('click','#apply-filter',function() {
        initialize_attendance_creation_recommendation_table('#attendance-creation-recommendation-datatable');
    });

}