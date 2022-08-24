(function($) {
    'use strict';

    $(function() {
        if($('#my-attendance-creation-datatable').length){
            initialize_my_attendance_creation_table('#my-attendance-creation-datatable');
        }

        initialize_click_events();
        initialize_on_change_events();
    });
})(jQuery);

function initialize_my_attendance_creation_table(datatable_name, buttons = false, show_all = false){
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
    var type = 'my attendance creation table';
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

    $(document).on('click','.view-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');

        sessionStorage.setItem('creation_id', creation_id);

        generate_modal('attendance creation details', 'Attendance Creation Details', 'LG' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','#request-attendance-creation',function() {        
        generate_modal('request attendance creation form', 'Request Attendance', 'R' , '0', '1', 'form', 'request-attendance-creation-form', '1', username);
    });

    $(document).on('click','.update-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');

        sessionStorage.setItem('creation_id', creation_id);
        
        generate_modal('update attendance creation form', 'Request Attendance', 'R' , '0', '1', 'form', 'update-attendance-creation-form', '0', username);
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

    $(document).on('click','.delete-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');
        var transaction = 'delete attendance creation';

        Swal.fire({
            title: 'Delete Attendance Creation',
            text: 'Are you sure you want to delete this attendance creation?',
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
                    data: {username : username, creation_id : creation_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Attendance Creation', 'The attendance creation has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Attendance Creation', 'The attendance creation does not exist.', 'info');
                            }

                            reload_datatable('#my-attendance-creation-datatable');
                        }
                        else{
                          show_alert('Delete Attendance Creation', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-attendance-creation',function() {
        var creation_id = [];
        var transaction = 'delete multiple attendance creation';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                creation_id.push(this.value);  
            }
        });

        if(creation_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Attendance Creations',
                text: 'Are you sure you want to delete these attendance creations?',
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
                        data: {username : username, creation_id : creation_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Attendance Creations', 'The attendance creations have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Attendance Creations', 'The attendance creations does not exist.', 'info');
                                }
    
                                reload_datatable('#my-attendance-creation-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Attendance Creations', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Attendance Creations', 'Please select the attendance creations you want to delete.', 'error');
        }
    });

    $(document).on('click','.for-recommend-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');
        var transaction = 'for recommendation attendance creation';

        Swal.fire({
            title: 'Tag Attendance Creation For Recommendation',
            text: 'Are you sure you want to tag this attendance creation for recommendation?',
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
                    data: {username : username, creation_id : creation_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'For Recommendation' || response === 'Not Found'){
                          if(response === 'For Recommendation'){
                            show_alert('Tag Attendance Creation For Recommendation', 'The attendance creation has been tagged for recommendation.', 'success');
                          }
                          else{
                            show_alert('Tag Attendance Creation For Recommendation', 'The attendance creation does not exist.', 'info');
                          }

                          reload_datatable('#my-attendance-creation-datatable');
                        }
                        else{
                          show_alert('Tag Attendance Creation For Recommendation', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#for-recommend-attendance-creation',function() {
        var creation_id = [];
        var transaction = 'for recommendation multiple attendance creation';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                creation_id.push(this.value);  
            }
        });

        if(creation_id.length > 0){
            Swal.fire({
                title: 'Tag Multiple Attendance Creations For Recommendation',
                text: 'Are you sure you want to tag these attendance creations for recommendation?',
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
                        data: {username : username, creation_id : creation_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'For Recommendation' || response === 'Not Found'){
                                if(response === 'For Recommendation'){
                                    show_alert('Tag Multiple Attendance Creations For Recommendation', 'The attendance creations have been tagged for recommendation.', 'success');
                                }
                                else{
                                    show_alert('Tag Multiple Attendance Creations For Recommendation', 'The attendance creation does not exist.', 'info');
                                }
      
                                reload_datatable('#my-attendance-creation-datatable');
                            }
                            else{
                                show_alert('Tag Multiple Attendance Creations For Recommendation', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Tag Multiple Attendance Creations For Recommendation', 'Please select the attendance creations you want to tag as pending.', 'error');
        }
    });

    $(document).on('click','.pending-attendance-creation',function() {
        var creation_id = $(this).data('creation-id');
        var transaction = 'pending attendance creation';

        Swal.fire({
            title: 'Tag Attendance Creation As Pending',
            text: 'Are you sure you want to tag this attendance creation as pending?',
            icon: 'info',
            showCancelButton: !0,
            confirmButtonText: 'Tag As Pending',
            cancelButtonText: 'Cancel',
            confirmButtonClass: 'btn btn-success mt-2',
            cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
            buttonsStyling: !1
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: {username : username, creation_id : creation_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Pending' || response === 'Not Found'){
                          if(response === 'Pending'){
                            show_alert('Tag Attendance Creation As Pending', 'The attendance creation has been tagged as pending.', 'success');
                          }
                          else{
                            show_alert('Tag Attendance Creation As Pending', 'The attendance creation does not exist.', 'info');
                          }

                          reload_datatable('#my-attendance-creation-datatable');
                        }
                        else{
                          show_alert('Tag Attendance Creation As Pending', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#pending-attendance-creation',function() {
        var creation_id = [];
        var transaction = 'pending multiple attendance creation';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                creation_id.push(this.value);  
            }
        });

        if(creation_id.length > 0){
            Swal.fire({
                title: 'Tag Multiple Attendance Creations As Pending',
                text: 'Are you sure you want to tag these attendance creations as pending?',
                icon: 'info',
                showCancelButton: !0,
                confirmButtonText: 'Tag As Pending',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-success mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, creation_id : creation_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Pending' || response === 'Not Found'){
                                if(response === 'Pending'){
                                    show_alert('Tag Multiple Attendance Creations As Pending', 'The attendance creations have been tagged as pending.', 'success');
                                }
                                else{
                                    show_alert('Tag Multiple Attendance Creations As Pending', 'The attendance creation does not exist.', 'info');
                                }
      
                                reload_datatable('#my-attendance-creation-datatable');
                            }
                            else{
                                show_alert('Tag Multiple Attendance Creations As Pending', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Tag Multiple Attendance Creations As Pending', 'Please select the attendance creations you want to tag as pending.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_my_attendance_creation_table('#my-attendance-creation-datatable');
    });

}

function initialize_on_change_events(){
    $(document).on('change','#attendance_id',function() {
        sessionStorage.setItem('attendance_id', this.value);

        display_form_details('request attendance creation form');
    });
}