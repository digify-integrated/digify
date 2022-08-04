(function($) {
    'use strict';

    $(function() {
        if($('#public-holiday-datatable').length){
            initialize_public_holiday_table('#public-holiday-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_public_holiday_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'public holiday table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'PUBLIC_HOLIDAY_TYPE' },
        { 'data' : 'HOLIDAY_DATE' },
        { 'data' : 'HOLIDAY_TYPE' },
        { 'data' : 'ACTION' }
    ];

    var column_definition = [
        { 'width': '1%','bSortable': false, 'aTargets': 0 },
        { 'width': '39%', 'aTargets': 1 },
        { 'width': '20%', 'aTargets': 2 },
        { 'width': '20%', 'aTargets': 3 },
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

    $(document).on('click','.view-public-holiday',function() {
        var public_holiday_id = $(this).data('public-holiday-id');

        sessionStorage.setItem('public_holiday_id', public_holiday_id);

        generate_modal('public holiday details', 'Public Holiday Details', 'R' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','#add-public-holiday',function() {
        generate_modal('public holiday form', 'Public Holiday', 'R' , '1', '1', 'form', 'public-holiday-form', '1', username);
    });

    $(document).on('click','.update-public-holiday',function() {
        var public_holiday_id = $(this).data('public-holiday-id');

        sessionStorage.setItem('public_holiday_id', public_holiday_id);
        
        generate_modal('public holiday form', 'Public Holiday', 'R' , '1', '1', 'form', 'public-holiday-form', '0', username);
    });
    
    $(document).on('click','.delete-public-holiday',function() {
        var public_holiday_id = $(this).data('public-holiday-id');
        var transaction = 'delete public holiday';

        Swal.fire({
            title: 'Delete Public Holiday',
            text: 'Are you sure you want to delete this public holiday?',
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
                    data: {username : username, public_holiday_id : public_holiday_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted' || response === 'Not Found'){
                            if(response === 'Deleted'){
                                show_alert('Delete Public Holiday', 'The public holiday has been deleted.', 'success');
                            }
                            else{
                                show_alert('Delete Public Holiday', 'The public holiday does not exist.', 'info');
                            }

                            reload_datatable('#public-holiday-datatable');
                        }
                        else{
                          show_alert('Delete Public Holiday', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-public-holiday',function() {
        var public_holiday_id = [];
        var transaction = 'delete multiple public holiday';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                public_holiday_id.push(this.value);  
            }
        });

        if(public_holiday_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Public Holidays',
                text: 'Are you sure you want to delete these public holidays?',
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
                        data: {username : username, public_holiday_id : public_holiday_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted' || response === 'Not Found'){
                                if(response === 'Deleted'){
                                    show_alert('Delete Multiple Public Holidays', 'The public holidays have been deleted.', 'success');
                                }
                                else{
                                    show_alert('Delete Multiple Public Holidays', 'The public holidays does not exist.', 'info');
                                }
    
                                reload_datatable('#public-holiday-datatable');
                            }
                            else{
                                show_alert('Delete Multiple Public Holidays', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Public Holidays', 'Please select the public holidays you want to delete.', 'error');
        }
    });

}