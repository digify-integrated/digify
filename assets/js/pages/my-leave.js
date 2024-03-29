(function($) {
    'use strict';

    $(function() {
        if($('#my-leave-datatable').length){
            initialize_my_leave_table('#my-leave-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_my_leave_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var filter_creation_start_date = $('#filter_creation_start_date').val();
    var filter_creation_end_date = $('#filter_creation_end_date').val();
    var filter_leave_start_date = $('#filter_leave_start_date').val();
    var filter_leave_end_date = $('#filter_leave_end_date').val();
    var filter_for_approval_start_date = $('#filter_for_approval_start_date').val();
    var filter_for_approval_end_date = $('#filter_for_approval_end_date').val();
    var filter_decision_start_date = $('#filter_decision_start_date').val();
    var filter_decision_end_date = $('#filter_decision_end_date').val();
    var filter_status = $('#filter_status').val();
    var filter_leave_type = $('#filter_leave_type').val();
    var type = 'my leave table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'LEAVE_TYPE' },
        { 'data' : 'LEAVE_DATE' },
        { 'data' : 'DURATION' },
        { 'data' : 'STATUS' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '20%', 'aTargets': 1 },
        { 'width': '20%', 'aTargets': 2 },
        { 'width': '15%', 'aTargets': 3 },
        { 'width': '10%', 'aTargets': 4 },
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
                'data': {'type' : type, 'username' : username, 'filter_creation_start_date' : filter_creation_start_date, 'filter_creation_end_date' : filter_creation_end_date, 'filter_leave_start_date' : filter_leave_start_date, 'filter_leave_end_date' : filter_leave_end_date, 'filter_for_approval_start_date' : filter_for_approval_start_date, 'filter_for_approval_end_date' : filter_for_approval_end_date, 'filter_decision_start_date' : filter_decision_start_date, 'filter_decision_end_date' : filter_decision_end_date, 'filter_status' : filter_status, 'filter_leave_type' : filter_leave_type},
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
                'data': {'type' : type, 'username' : username, 'filter_creation_start_date' : filter_creation_start_date, 'filter_creation_end_date' : filter_creation_end_date, 'filter_leave_start_date' : filter_leave_start_date, 'filter_leave_end_date' : filter_leave_end_date, 'filter_for_approval_start_date' : filter_for_approval_start_date, 'filter_for_approval_end_date' : filter_for_approval_end_date, 'filter_decision_start_date' : filter_decision_start_date, 'filter_decision_end_date' : filter_decision_end_date, 'filter_status' : filter_status, 'filter_leave_type' : filter_leave_type},
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

function initialize_leave_supporting_document_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var leave_id = $('#leave_id').val();
    var type = 'leave supporting document table';
    var settings;

    var column = [ 
        { 'data' : 'DOCUMENT_NAME' },
        { 'data' : 'UPLOAD_DATE' },
        { 'data' : 'UPLOADED_BY' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '20%', 'aTargets': 0 },
        { 'width': '20%', 'aTargets': 1 },
        { 'width': '20%', 'aTargets': 2 },
        { 'width': '20%','bSortable': false, 'aTargets': 3 }
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
                'data': {'type' : type, 'username' : username, 'leave_id' : leave_id},
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
                'data': {'type' : type, 'username' : username, 'leave_id' : leave_id},
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

    $(document).on('click','.view-leave',function() {
        var leave_id = $(this).data('leave-id');

        sessionStorage.setItem('leave_id', leave_id);

        generate_modal('leave details', 'Leave Details', 'LG' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','#add-leave',function() {
        generate_modal('add leave form', 'Add Leave', 'R' , '0', '1', 'form', 'add-leave-form', '1', username);
    });

    $(document).on('click','.update-leave',function() {
        var leave_id = $(this).data('leave-id');

        sessionStorage.setItem('leave_id', leave_id);
        
        generate_modal('update leave form', 'Update Leave', 'R' , '0', '1', 'form', 'update-leave-form', '0', username);
    });

    $(document).on('click','.add-leave-supporting-document',function() {
        var leave_id = $(this).data('leave-id');

        sessionStorage.setItem('leave_id', leave_id);
        
        generate_modal('add leave supporting document form', 'Add Leave Supporting Document', 'LG' , '0', '1', 'form', 'add-leave-supporting-document-form', '0', username);
    });

    $(document).on('click','.cancel-leave',function() {
        var leave_id = $(this).data('leave-id');

        sessionStorage.setItem('leave_id', leave_id);
        
        generate_modal('cancel leave form', 'Cancel Leave', 'R' , '0', '1', 'form', 'cancel-leave-form', '1', username);
    });

    $(document).on('click','#cancel-leave',function() {
        var leave_id = [];

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                leave_id.push(this.value);  
            }
        });

        if(leave_id.length > 0){
            sessionStorage.setItem('leave_id', leave_id);
        }

        generate_modal('cancel multiple leave form', 'Cancel Multiple Leave', 'R' , '0', '1', 'form', 'cancel-multiple-leave-form', '1', username);
    });

    $(document).on('click','.delete-leave',function() {
        var leave_id = $(this).data('leave-id');
        var transaction = 'delete leave';

        Swal.fire({
            title: 'Delete Leave',
            text: 'Are you sure you want to delete this leave?',
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
                    data: {username : username, leave_id : leave_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Leave', 'The leave has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Leave', 'The leave does not exist.', 'info');
                            }

                            reload_datatable('#my-leave-datatable');
                        }
                        else{
                          show_alert('Delete Leave', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-leave',function() {
        var leave_id = [];
        var transaction = 'delete multiple leave';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                leave_id.push(this.value);  
            }
        });

        if(leave_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Leaves',
                text: 'Are you sure you want to delete these leaves?',
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
                        data: {username : username, leave_id : leave_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Leaves', 'The leaves have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Leaves', 'The leaves does not exist.', 'info');
                                }
    
                                reload_datatable('#my-leave-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Leaves', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Leaves', 'Please select the leaves you want to delete.', 'error');
        }
    });

    $(document).on('click','.for-approval-leave',function() {
        var leave_id = $(this).data('leave-id');
        var transaction = 'for approval leave';

        Swal.fire({
            title: 'Tag Leave For Approval',
            text: 'Are you sure you want to tag this leave for approval?',
            icon: 'info',
            showCancelButton: !0,
            confirmButtonText: 'For Approval',
            cancelButtonText: 'Cancel',
            confirmButtonClass: 'btn btn-success mt-2',
            cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
            buttonsStyling: !1
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: {username : username, leave_id : leave_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'For Approval' || response === 'Not Found' || response === 'Leave Allocation'){
                            if(response === 'For Approval'){
                                show_alert('Tag Leave For Approval', 'The leave has been tagged for approval.', 'success');
                            }
                            else if(response === 'Leave Allocation'){
                                show_alert('Tag Leave For Approval', 'Your leave application is greater than your allocation.', 'error');
                            }
                            else{
                                show_alert('Tag Leave For Approval', 'The leave does not exist.', 'info');
                            }

                            reload_datatable('#my-leave-datatable');
                        }
                        else{
                          show_alert('Tag Leave For Approval', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#for-approval-leave',function() {
        var leave_id = [];
        var transaction = 'for approval multiple leave';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                leave_id.push(this.value);  
            }
        });

        if(leave_id.length > 0){
            Swal.fire({
                title: 'Tag Multiple Leaves For Approval',
                text: 'Are you sure you want to tag these leaves for approval?',
                icon: 'info',
                showCancelButton: !0,
                confirmButtonText: 'For Approval',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-success mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, leave_id : leave_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'For Approval' || response === 'Not Found' || response === 'Leave Allocation'){
                                if(response === 'For Approval'){
                                    show_alert('Tag Multiple Leaves For Approval', 'The leaves have been tagged for approval.', 'success');
                                }
                                else if(response === 'Leave Allocation'){
                                    show_alert('Tag Multiple Leaves For Approval', 'Your leave application is greater than your allocation.', 'error');
                                }
                                else{
                                    show_alert('Tag Multiple Leaves For Approval', 'The leave does not exist.', 'info');
                                }
      
                                reload_datatable('#my-leave-datatable');
                            }
                            else{
                                show_alert('Tag Multiple Leaves For Approval', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Tag Multiple Leaves For Approval', 'Please select the leaves you want to delete.', 'error');
        }
    });

    $(document).on('click','.delete-leave-supporting-document',function() {
        var leave_supporting_document_id = $(this).data('leave-supporting-document-id');
        var transaction = 'delete leave supporting document';

        Swal.fire({
            title: 'Delete Leave Supporting Document',
            text: 'Are you sure you want to delete this leave supporting document?',
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
                    data: {username : username, leave_supporting_document_id : leave_supporting_document_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Leave Supporting Document', 'The leave supporting document has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Leave Supporting Document', 'The leave supporting document does not exist.', 'info');
                            }

                            reload_datatable('#leave-supporting-document-table');
                        }
                        else{
                          show_alert('Delete Leave Supporting Document', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','.pending-leave',function() {
        var leave_id = $(this).data('leave-id');
        var transaction = 'pending leave';

        Swal.fire({
            title: 'Tag Leave As Pending',
            text: 'Are you sure you want to tag this leave as pending?',
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
                    data: {username : username, leave_id : leave_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Pending' || response === 'Not Found'){
                          if(response === 'Pending'){
                            show_alert('Tag Leave As Pending', 'The leave has been tagged as pending.', 'success');
                          }
                          else{
                            show_alert('Tag Leave As Pending', 'The leave does not exist.', 'info');
                          }

                          reload_datatable('#my-leave-datatable');
                        }
                        else{
                          show_alert('Tag Leave As Pending', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#pending-leave',function() {
        var leave_id = [];
        var transaction = 'pending multiple leave';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                leave_id.push(this.value);  
            }
        });

        if(leave_id.length > 0){
            Swal.fire({
                title: 'Tag Multiple Leaves As Pending',
                text: 'Are you sure you want to tag these leaves as pending?',
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
                        data: {username : username, leave_id : leave_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Pending' || response === 'Not Found'){
                                if(response === 'Pending'){
                                    show_alert('Tag Multiple Leaves As Pending', 'The leaves have been tagged as pending.', 'success');
                                }
                                else{
                                    show_alert('Tag Multiple Leaves As Pending', 'The leave does not exist.', 'info');
                                }
      
                                reload_datatable('#my-leave-datatable');
                            }
                            else{
                                show_alert('Tag Multiple Leaves As Pending', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Tag Multiple Leaves As Pending', 'Please select the leaves you want to tag as pending.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_my_leave_table('#my-leave-datatable');
    });

}