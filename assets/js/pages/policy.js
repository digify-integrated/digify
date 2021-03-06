(function($) {
    'use strict';

    $(function() {
        if($('#policy-datatable').length){
            initialize_policy_table('#policy-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_policy_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'policy table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'POLICY_ID' },
        { 'data' : 'POLICY' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '14%', 'aTargets': 1 },
        { 'width': '65%', 'aTargets': 2 },
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

    $(document).on('click','#add-policy',function() {
        generate_modal('policy form', 'Policy', 'R' , '1', '1', 'form', 'policy-form', '1', username);
    });

    $(document).on('click','.update-policy',function() {
        var policy_id = $(this).data('policy-id');

        sessionStorage.setItem('policy_id', policy_id);
        
        generate_modal('policy form', 'Policy', 'R' , '1', '1', 'form', 'policy-form', '0', username);
    });
    
    $(document).on('click','.delete-policy',function() {
        var policy_id = $(this).data('policy-id');
        var transaction = 'delete policy';

        Swal.fire({
            title: 'Delete Policy',
            text: 'Are you sure you want to delete this policy?',
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
                    data: {username : username, policy_id : policy_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Policy', 'The policy has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Policy', 'The policy does not exist.', 'info');
                            }

                            reload_datatable('#policy-datatable');
                        }
                        else{
                          show_alert('Delete Policy', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-policy',function() {
        var policy_id = [];
        var transaction = 'delete multiple policy';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                policy_id.push(this.value);  
            }
        });

        if(policy_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Policies',
                text: 'Are you sure you want to delete these policies?',
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
                        data: {username : username, policy_id : policy_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Policies', 'The policies have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Policies', 'The policy does not exist.', 'info');
                                }
    
                                reload_datatable('#policy-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Policies', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Policies', 'Please select the policies you want to delete.', 'error');
        }
    });

}