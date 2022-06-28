(function($) {
    'use strict';

    $(function() {
        if($('#working-hours-datatable').length){
            initialize_working_hours_table('#working-hours-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_working_hours_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'working hours table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'WORKING_HOURS' },
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

    $(document).on('click','.view-working-hours',function() {
        var working_hours_id = $(this).data('working-hours-id');

        sessionStorage.setItem('working_hours_id', working_hours_id);

        generate_modal('working hours details', 'Working Hours Details', 'LG' , '1', '0', 'element', '', '0', username);
    });


    $(document).on('click','#add-working-hours',function() {
        generate_modal('working hours form', 'Working Hours', 'R' , '1', '1', 'form', 'working-hours-form', '1', username);
    });

    $(document).on('click','.update-working-hours',function() {
        var working_hours_id = $(this).data('working-hours-id');

        sessionStorage.setItem('working_hours_id', working_hours_id);
        
        generate_modal('working hours form', 'Working Hours', 'R' , '1', '1', 'form', 'working-hours-form', '0', username);
    });

    $(document).on('click','.update-regular-working-hours',function() {
        var working_hours_id = $(this).data('working-hours-id');

        sessionStorage.setItem('working_hours_id', working_hours_id);
        
        generate_modal('regular working hours form', 'Regular Working Hours', 'LG' , '1', '1', 'form', 'regular-working-hours-form', '0', username);
    });

    $(document).on('click','.update-scheduled-working-hours',function() {
        var working_hours_id = $(this).data('working-hours-id');

        sessionStorage.setItem('working_hours_id', working_hours_id);
        
        generate_modal('scheduled working hours form', 'Scheduled Working Hours', 'LG' , '1', '1', 'form', 'scheduled-working-hours-form', '0', username);
    });
    
    $(document).on('click','.delete-working-hours',function() {
        var working_hours_id = $(this).data('working-hours-id');
        var transaction = 'delete working hours';

        Swal.fire({
            title: 'Delete Working Hours',
            text: 'Are you sure you want to delete this working hours?',
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
                    data: {username : username, working_hours_id : working_hours_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted'){
                          show_alert('Delete Working Hours', 'The working hours has been deleted.', 'success');

                          reload_datatable('#working-hours-datatable');
                        }
                        else if(response === 'Not Found'){
                          show_alert('Delete Working Hours', 'The working hours does not exist.', 'info');
                        }
                        else{
                          show_alert('Delete Working Hours', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-working-hours',function() {
        var working_hours_id = [];
        var transaction = 'delete multiple working hours';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                working_hours_id.push(this.value);  
            }
        });

        if(working_hours_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Working Hours',
                text: 'Are you sure you want to delete these working hours?',
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
                        data: {username : username, working_hours_id : working_hours_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted'){
                                show_alert('Delete Multiple Working Hours', 'The working hours have been deleted.', 'success');
    
                                reload_datatable('#working-hours-datatable');
                            }
                            else if(response === 'Not Found'){
                                show_alert('Delete Multiple Working Hours', 'The working hours does not exist.', 'info');
                            }
                            else{
                                show_alert('Delete Multiple Working Hours', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Working Hours', 'Please select the working hours you want to delete.', 'error');
        }
    });

}