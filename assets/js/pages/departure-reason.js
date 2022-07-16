(function($) {
    'use strict';

    $(function() {
        if($('#departure-reason-datatable').length){
            initialize_departure_reason_table('#departure-reason-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_departure_reason_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'departure reason table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'DEPARTURE_REASON' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '79%', 'aTargets': 1 },
        { 'width': '20%','bSortable': false, 'aTargets': 2 },
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

    $(document).on('click','#add-departure-reason',function() {
        generate_modal('departure reason form', 'Departure Reason', 'R' , '1', '1', 'form', 'departure-reason-form', '1', username);
    });

    $(document).on('click','.update-departure-reason',function() {
        var departure_reason_id = $(this).data('departure-reason-id');

        sessionStorage.setItem('departure_reason_id', departure_reason_id);
        
        generate_modal('departure reason form', 'Departure Reason', 'R' , '1', '1', 'form', 'departure-reason-form', '0', username);
    });
    
    $(document).on('click','.delete-departure-reason',function() {
        var departure_reason_id = $(this).data('departure-reason-id');
        var transaction = 'delete departure reason';

        Swal.fire({
            title: 'Delete Departure Reason',
            text: 'Are you sure you want to delete this departure reason?',
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
                    data: {username : username, departure_reason_id : departure_reason_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Departure Reason', 'The departure reason has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Departure Reason', 'The departure reason does not exist.', 'info');
                            }

                            reload_datatable('#departure-reason-datatable');
                        }
                        else{
                          show_alert('Delete Departure Reason', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-departure-reason',function() {
        var departure_reason_id = [];
        var transaction = 'delete multiple departure reason';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                departure_reason_id.push(this.value);  
            }
        });

        if(departure_reason_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Departure Reasons',
                text: 'Are you sure you want to delete these departure reasons?',
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
                        data: {username : username, departure_reason_id : departure_reason_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Departure Reasons', 'The departure reasons have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Departure Reasons', 'The departure reason does not exist.', 'info');
                                }
    
                                reload_datatable('#departure-reason-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Departure Reasons', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Departure Reasons', 'Please select the departure reasons you want to delete.', 'error');
        }
    });

}