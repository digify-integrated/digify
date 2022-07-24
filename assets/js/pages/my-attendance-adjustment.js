(function($) {
    'use strict';

    $(function() {
        if($('#my-attendance-adjustment-datatable').length){
            initialize_my_attendance_adjustment_table('#my-attendance-adjustment-datatable');
        }

        initialize_click_events();
        initialize_on_change_events();
    });
})(jQuery);

function initialize_my_attendance_adjustment_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var filter_creation_start_date = $('#filter_creation_start_date').val();
    var filter_creation_end_date = $('#filter_creation_end_date').val();
    var filter_for_recommendation_start_date = $('#filter_for_recommendation_start_date').val();
    var filter_for_recommendation_end_date = $('#filter_for_recommendation_end_date').val();
    var filter_recommendation_start_date = $('#filter_recommendation_start_date').val();
    var filter_recommendation_end_date = $('#filter_recommendation_end_date').val();
    var filter_decision_start_date = $('#filter_decision_start_date').val();
    var filter_decision_end_date = $('#filter_decision_end_date').val();
    var filter_status = $('#filter_status').val();
    var filter_sanction = $('#filter_sanction').val();
    var type = 'my attendance adjustment table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'TIME_IN' },
        { 'data' : 'TIME_OUT' },
        { 'data' : 'STATUS' },
        { 'data' : 'SANCTION' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '20%', 'aTargets': 1 },
        { 'width': '20%', 'aTargets': 2 },
        { 'width': '15%', 'aTargets': 3 },
        { 'width': '15%', 'aTargets': 4 },
        { 'width': '20%','bSortable': false, 'aTargets': 5 }
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
                'data': {'type' : type, 'username' : username, 'filter_creation_start_date' : filter_creation_start_date, 'filter_creation_end_date' : filter_creation_end_date, 'filter_for_recommendation_start_date' : filter_for_recommendation_start_date, 'filter_for_recommendation_end_date' : filter_for_recommendation_end_date, 'filter_recommendation_start_date' : filter_recommendation_start_date, 'filter_recommendation_end_date' : filter_recommendation_end_date, 'filter_decision_start_date' : filter_decision_start_date, 'filter_decision_end_date' : filter_decision_end_date, 'filter_status' : filter_status, 'filter_sanction' : filter_sanction},
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
                'data': {'type' : type, 'username' : username, 'filter_creation_start_date' : filter_creation_start_date, 'filter_creation_end_date' : filter_creation_end_date, 'filter_for_recommendation_start_date' : filter_for_recommendation_start_date, 'filter_for_recommendation_end_date' : filter_for_recommendation_end_date, 'filter_recommendation_start_date' : filter_recommendation_start_date, 'filter_recommendation_end_date' : filter_recommendation_end_date, 'filter_decision_start_date' : filter_decision_start_date, 'filter_decision_end_date' : filter_decision_end_date, 'filter_status' : filter_status, 'filter_sanction' : filter_sanction},
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

    $(document).on('click','#request-attendance-adjustment',function() {        
        generate_modal('request attendance adjustment form', 'Request Attendance Adjustment', 'R' , '0', '1', 'form', 'request-attendance-adjustment-form', '1', username);
    });

    $(document).on('click','.update-attendance-adjustment',function() {
        var adjustment_id = $(this).data('adjustment-id');
        var adjustment_type = $(this).data('adjustment-type');

        sessionStorage.setItem('adjustment_id', adjustment_id);
        
        if(adjustment_type == 'full'){
            generate_modal('update full attendance adustment form', 'Request Attendance Adjustment', 'R' , '0', '1', 'form', 'update-full-attendance-adjustment-form', '0', username);
        }
        else{
            generate_modal('update partial attendance adustment form', 'Request Attendance Adjustment', 'R' , '0', '1', 'form', 'update-partial-attendance-adjustment-form', '0', username);
        }
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

    $(document).on('click','.delete-attendance-adjustment',function() {
        var adjustment_id = $(this).data('adjustment-id');
        var transaction = 'delete attendance adjustment';

        Swal.fire({
            title: 'Delete Attendance Adjustment',
            text: 'Are you sure you want to delete this attendance adjustment?',
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
                    data: {username : username, adjustment_id : adjustment_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Attendance Adjustment', 'The attendance adjustment has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Attendance Adjustment', 'The attendance adjustment does not exist.', 'info');
                            }

                            reload_datatable('#my-attendance-adjustment-datatable');
                        }
                        else{
                          show_alert('Delete Attendance Adjustment', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-attendance-adjustment',function() {
        var adjustment_id = [];
        var transaction = 'delete multiple attendance adjustment';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                adjustment_id.push(this.value);  
            }
        });

        if(adjustment_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Attendance Adjustments',
                text: 'Are you sure you want to delete these attendance adjustments?',
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
                        data: {username : username, adjustment_id : adjustment_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Attendance Adjustments', 'The attendance adjustments have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Attendance Adjustments', 'The attendance adjustments does not exist.', 'info');
                                }
    
                                reload_datatable('#my-attendance-adjustment-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Attendance Adjustments', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Attendance Adjustments', 'Please select the attendance adjustments you want to delete.', 'error');
        }
    });

    $(document).on('click','.for-recommend-attendance-adjustment',function() {
        var adjustment_id = $(this).data('adjustment-id');
        var transaction = 'for recommendation attendance adjustment';

        Swal.fire({
            title: 'Tag Attendance Adjustment For Recommendation',
            text: 'Are you sure you want to tag this attendance adjustment for recommendation?',
            icon: 'info',
            showCancelButton: !0,
            confirmButtonText: 'For Recommendation',
            cancelButtonText: 'Cancel',
            confirmButtonClass: 'btn btn-success mt-2',
            cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
            buttonsStyling: !1
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: {username : username, adjustment_id : adjustment_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'For Recommendation' || response === 'Not Found'){
                          if(response === 'For Recommendation'){
                            show_alert('Tag Attendance Adjustment For Recommendation', 'The attendance adjustment has been tagged for recommendation.', 'success');
                          }
                          else{
                            show_alert('Tag Attendance Adjustment For Recommendation', 'The attendance adjustment does not exist.', 'info');
                          }

                          reload_datatable('#my-attendance-adjustment-datatable');
                        }
                        else{
                          show_alert('Tag Attendance Adjustment For Recommendation', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#for-recommend-attendance-adjustment',function() {
        var adjustment_id = [];
        var transaction = 'for recommendation multiple attendance adjustment';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                adjustment_id.push(this.value);  
            }
        });

        if(adjustment_id.length > 0){
            Swal.fire({
                title: 'Tag Multiple Attendance Adjustments For Recommendation',
                text: 'Are you sure you want to tag these attendance adjustments for recommendation?',
                icon: 'info',
                showCancelButton: !0,
                confirmButtonText: 'For Recommendation',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-success mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, adjustment_id : adjustment_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'For Recommendation' || response === 'Not Found'){
                                if(response === 'For Recommendation'){
                                    show_alert('Tag Multiple Attendance Adjustments For Recommendation', 'The attendance adjustments have been tagged for recommendation.', 'success');
                                }
                                else{
                                    show_alert('Tag Multiple Attendance Adjustments For Recommendation', 'The attendance adjustment does not exist.', 'info');
                                }
      
                                reload_datatable('#my-attendance-adjustment-datatable');
                            }
                            else{
                                show_alert('Tag Multiple Attendance Adjustments For Recommendation', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Tag Multiple Attendance Adjustments For Recommendation', 'Please select the attendance adjustments you want to delete.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_my_attendance_adjustment_table('#my-attendance-adjustment-datatable');
    });

}

function initialize_on_change_events(){
    $(document).on('change','#attendance_id',function() {
        sessionStorage.setItem('attendance_id', this.value);
        document.getElementById('time_in_date').disabled = true;

        display_form_details('request attendance adjustment form');
    });
}