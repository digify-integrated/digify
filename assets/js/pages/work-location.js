(function($) {
    'use strict';

    $(function() {
        if($('#work-location-datatable').length){
            initialize_work_location_table('#work-location-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_work_location_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'work location table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'WORK_LOCATION' },
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

    $(document).on('click','.view-work-location',function() {
        var work_location_id = $(this).data('work-location-id');

        sessionStorage.setItem('work_location_id', work_location_id);

        generate_modal('work location details', 'Work Location Details', 'R' , '1', '0', 'element', '', '0', username);
    });

    $(document).on('click','#add-work-location',function() {
        generate_modal('work location form', 'Work Location', 'XL' , '1', '1', 'form', 'work-location-form', '1', username);
    });

    $(document).on('click','.update-work-location',function() {
        var work_location_id = $(this).data('work-location-id');

        sessionStorage.setItem('work_location_id', work_location_id);
        
        generate_modal('work location form', 'Work Location', 'XL' , '1', '1', 'form', 'work-location-form', '0', username);
    });
    
    $(document).on('click','.delete-work-location',function() {
        var work_location_id = $(this).data('work-location-id');
        var transaction = 'delete work location';

        Swal.fire({
            title: 'Delete Work Location',
            text: 'Are you sure you want to delete this work location?',
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
                    data: {username : username, work_location_id : work_location_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted'){
                          show_alert('Delete Work Location', 'The work location has been deleted.', 'success');

                          reload_datatable('#work-location-datatable');
                        }
                        else if(response === 'Not Found'){
                          show_alert('Delete Work Location', 'The work location does not exist.', 'info');
                        }
                        else{
                          show_alert('Delete Work Location', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-work-location',function() {
        var work_location_id = [];
        var transaction = 'delete multiple work location';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                work_location_id.push(this.value);  
            }
        });

        if(work_location_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Work Locations',
                text: 'Are you sure you want to delete these work locations?',
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
                        data: {username : username, work_location_id : work_location_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted'){
                                show_alert('Delete Multiple Work Locations', 'The work locations have been deleted.', 'success');
    
                                reload_datatable('#work-location-datatable');
                            }
                            else if(response === 'Not Found'){
                                show_alert('Delete Multiple Work Locations', 'The work location does not exist.', 'info');
                            }
                            else{
                                show_alert('Delete Multiple Work Locations', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Work Locations', 'Please select the work locations you want to delete.', 'error');
        }
    });

}