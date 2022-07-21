(function($) {
    'use strict';

    $(function() {
        if($('#approval-type-datatable').length){
            initialize_approval_type_table('#approval-type-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_approval_type_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var filter_approval_type_status = $('#filter_approval_type_status').val();
    var type = 'approval type table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'APPROVAL_TYPE' },
        { 'data' : 'STATUS' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '59%', 'aTargets': 1 },
        { 'width': '20%', 'aTargets': 2 },
        { 'width': '20%','bSortable': false, 'aTargets': 3 },
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
                'data': {'type' : type, 'username' : username, 'filter_approval_type_status' : filter_approval_type_status},
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
                'data': {'type' : type, 'username' : username, 'filter_approval_type_status' : filter_approval_type_status},
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

    $(document).on('click','.view-approval-type',function() {
        var approval_type_id = $(this).data('approval-type-id');

        sessionStorage.setItem('approval_type_id', approval_type_id);

        generate_modal('approval type details', 'Approval Type Details', 'R' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','#add-approval-type',function() {
        generate_modal('approval type form', 'Approval Type', 'R' , '1', '1', 'form', 'approval-type-form', '1', username);
    });

    $(document).on('click','.update-approval-type',function() {
        var approval_type_id = $(this).data('approval-type-id');

        sessionStorage.setItem('approval_type_id', approval_type_id);
        
        generate_modal('approval type form', 'Approval Type', 'R' , '1', '1', 'form', 'approval-type-form', '0', username);
    });

    $(document).on('click','.activate-approval-type',function() {
        var approval_type_id = $(this).data('approval-type-id');
        var transaction = 'activate approval type';

        Swal.fire({
            title: 'Activate Approval Type',
            text: 'Are you sure you want to activate this approval type?',
            icon: 'info',
            showCancelButton: !0,
            confirmButtonText: 'Activate',
            cancelButtonText: 'Cancel',
            confirmButtonClass: 'btn btn-success mt-2',
            cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
            buttonsStyling: !1
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: {username : username, approval_type_id : approval_type_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Activated' || response === 'Not Found'){
                            if(response === 'Activated'){
                                show_alert('Activate Approval Type', 'The approval type has been activated.', 'success');
                            }
                            else{
                                show_alert('Activate Approval Type', 'The approval type does not exist.', 'info');
                            }

                            reload_datatable('#approval-type-datatable');
                        }
                        else{
                          show_alert('Activate Approval Type', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','.deactivate-approval-type',function() {
        var approval_type_id = $(this).data('approval-type-id');
        var transaction = 'deactivate approval type';

        Swal.fire({
            title: 'Deactivate Approval Type',
            text: 'Are you sure you want to deactivate this approval type?',
            icon: 'warning',
            showCancelButton: !0,
            confirmButtonText: 'Deactivate',
            cancelButtonText: 'Cancel',
            confirmButtonClass: 'btn btn-danger mt-2',
            cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
            buttonsStyling: !1
        }).then(function(result) {
            if (result.value) {
                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: {username : username, approval_type_id : approval_type_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deactivated' || response === 'Not Found'){
                            if(response === 'Deactivated'){
                                show_alert('Deactivate Approval Type', 'The approval type has been deactivated.', 'success');
                            }
                            else{
                                show_alert('Deactivate Approval Type', 'The approval type does not exist.', 'info');
                            }

                            reload_datatable('#approval-type-datatable');
                        }
                        else{
                          show_alert('Deactivate Approval Type', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#activate-approval-type',function() {N
        var approval_type_id = [];
        var transaction = 'activate multiple approval type';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                approval_type_id.push(this.value);  
            }
        });

        if(approval_type_id.length > 0){
            Swal.fire({
                title: 'Activate Multiple Approval Types',
                text: 'Are you sure you want to activate these approval types?',
                icon: 'info',
                showCancelButton: !0,
                confirmButtonText: 'Activate',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-success mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, approval_type_id : approval_type_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Activated' || response === 'Not Found'){
                                if(response === 'Activated'){
                                    show_alert('Activate Multiple Approval Types', 'The approval types have been activated.', 'success');
                                }
                                else{
                                    show_alert('Activate Multiple Approval Types', 'The approval type does not exist.', 'info');
                                }
    
                                reload_datatable('#approval-type-datatable');
                            }
                            else{
                              show_alert('Activate Multiple Approval Types', response, 'error');
                            }
                        }
                    });
                    return false;
                }
            });
        }
        else{
            show_alert('Activate Multiple Approval Types', 'Please select the approval types you want to activate.', 'error');
        }
    });

    $(document).on('click','#deactivate-approval-type',function() {
        var approval_type_id = [];
        var transaction = 'deactivate multiple approval type';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                approval_type_id.push(this.value);  
            }
        });

        if(approval_type_id.length > 0){
            Swal.fire({
                title: 'Deactivate Multiple Approval Types',
                text: 'Are you sure you want to deactivate these approval types?',
                icon: 'warning',
                showCancelButton: !0,
                confirmButtonText: 'Deactivate',
                cancelButtonText: 'Cancel',
                confirmButtonClass: 'btn btn-danger mt-2',
                cancelButtonClass: 'btn btn-secondary ms-2 mt-2',
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: 'controller.php',
                        data: {username : username, approval_type_id : approval_type_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deactivated' || response === 'Not Found'){
                                if(response === 'Deactivated'){
                                    show_alert('Deactivate Multiple Approval Types', 'The approval types have been deactivated.', 'success');
                                }
                                else{
                                    show_alert('Deactivate Multiple Approval Types', 'The approval type does not exist.', 'info');
                                }
    
                                reload_datatable('#approval-type-datatable');
                            }
                            else{
                              show_alert('Deactivate Multiple Approval Types', response, 'error');
                            }
                        }
                    });
                    return false;
                }
            });
        }
        else{
            show_alert('Deactivate Multiple Approval Types', 'Please select the approval types you want to deactivate.', 'error');
        }
    });
    
    $(document).on('click','.delete-approval-type',function() {
        var approval_type_id = $(this).data('approval-type-id');
        var transaction = 'delete approval type';

        Swal.fire({
            title: 'Delete Approval Type',
            text: 'Are you sure you want to delete this approval type?',
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
                    data: {username : username, approval_type_id : approval_type_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Approval Type', 'The approval type has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Approval Type', 'The approval type does not exist.', 'info');
                            }

                            reload_datatable('#approval-type-datatable');
                        }
                        else{
                          show_alert('Delete Approval Type', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-approval-type',function() {
        var approval_type_id = [];
        var transaction = 'delete multiple approval type';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                approval_type_id.push(this.value);  
            }
        });

        if(approval_type_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Approval Types',
                text: 'Are you sure you want to delete these approval types?',
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
                        data: {username : username, approval_type_id : approval_type_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Approval Types', 'The approval types have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Approval Types', 'The approval types does not exist.', 'info');
                                }
    
                                reload_datatable('#approval-type-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Approval Types', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Approval Types', 'Please select the approval types you want to delete.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_approval_type_table('#approval-type-datatable');
    });
}