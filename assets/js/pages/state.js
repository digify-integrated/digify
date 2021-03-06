(function($) {
    'use strict';

    $(function() {
        if($('#state-datatable').length){
            initialize_state_table('#state-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_state_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var filter_country = $('#filter_country').val();
    var type = 'state table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'STATE_ID' },
        { 'data' : 'STATE_NAME' },
        { 'data' : 'COUNTRY' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '15%', 'aTargets': 1 },
        { 'width': '32%', 'aTargets': 2 },
        { 'width': '32%', 'aTargets': 3 },
        { 'width': '20%','bSortable': false, 'aTargets': 4 },
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
                'data': {'type' : type, 'filter_country' : filter_country, 'username' : username},
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
                'data': {'type' : type, 'filter_country' : filter_country, 'username' : username},
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

    $(document).on('click','#add-state',function() {
        generate_modal('state form', 'State', 'R' , '1', '1', 'form', 'state-form', '1', username);
    });

    $(document).on('click','.update-state',function() {
        var state_id = $(this).data('state-id');

        sessionStorage.setItem('state_id', state_id);
        
        generate_modal('state form', 'State', 'R' , '1', '1', 'form', 'state-form', '0', username);
    });
    
    $(document).on('click','.delete-state',function() {
        var state_id = $(this).data('state-id');
        var transaction = 'delete state';

        Swal.fire({
            title: 'Delete State',
            text: 'Are you sure you want to delete this state?',
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
                    data: {username : username, state_id : state_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete State', 'The state has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete State', 'The state does not exist.', 'info');
                            }

                            reload_datatable('#state-datatable');
                        }
                        else{
                          show_alert('Delete State', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-state',function() {
        var state_id = [];
        var transaction = 'delete multiple state';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                state_id.push(this.value);  
            }
        });

        if(state_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple States',
                text: 'Are you sure you want to delete these states?',
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
                        data: {username : username, state_id : state_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple States', 'The states have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple States', 'The state does not exist.', 'info');
                                }
    
                                reload_datatable('#state-datatable');
                            }
                            else{
                                show_alert('Delete Multiple States', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple States', 'Please select the states you want to delete.', 'error');
        }
    });

    $(document).on('click','#apply-filter',function() {
        initialize_state_table('#state-datatable');
    });

}