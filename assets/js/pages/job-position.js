(function($) {
    'use strict';

    $(function() {
        if($('#job-position-datatable').length){
            initialize_job_position_table('#job-position-datatable');
        }

        initialize_click_events();
    });
})(jQuery);

function initialize_job_position_table(datatable_name, buttons = false, show_all = false){
    hide_multiple_buttons();
    
    var username = $('#username').text();
    var type = 'job position table';
    var settings;

    var column = [ 
        { 'data' : 'CHECK_BOX' },
        { 'data' : 'JOB_POSITION' },
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

    $(document).on('click','.view-job-position',function() {
        var job_position_id = $(this).data('job-position-id');

        sessionStorage.setItem('job_position_id', job_position_id);

        generate_modal('job position details', 'Job Position Details', 'R' , '1', '0', 'element', '', '0', username);
    });


    $(document).on('click','#add-job-position',function() {
        generate_modal('job position form', 'Job Position', 'R' , '1', '1', 'form', 'job-position-form', '1', username);
    });

    $(document).on('click','.update-job-position',function() {
        var job_position_id = $(this).data('job-position-id');

        sessionStorage.setItem('job_position_id', job_position_id);
        
        generate_modal('job position form', 'Job Position', 'R' , '1', '1', 'form', 'job-position-form', '0', username);
    });
    
    $(document).on('click','.delete-job-position',function() {
        var job_position_id = $(this).data('job-position-id');
        var transaction = 'delete job position';

        Swal.fire({
            title: 'Delete Job Position',
            text: 'Are you sure you want to delete this job position?',
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
                    data: {username : username, job_position_id : job_position_id, transaction : transaction},
                    success: function (response) {
                        if(response === 'Deleted'){
                          show_alert('Delete Job Position', 'The job position has been deleted.', 'success');

                          reload_datatable('#job-position-datatable');
                        }
                        else if(response === 'Not Found'){
                          show_alert('Delete Job Position', 'The job position does not exist.', 'info');
                        }
                        else{
                          show_alert('Delete Job Position', response, 'error');
                        }
                    }
                });
                return false;
            }
        });
    });

    $(document).on('click','#delete-job-position',function() {
        var job_position_id = [];
        var transaction = 'delete multiple job position';

        $('.datatable-checkbox-children').each(function(){
            if($(this).is(':checked')){  
                job_position_id.push(this.value);  
            }
        });

        if(job_position_id.length > 0){
            Swal.fire({
                title: 'Delete Multiple Job Positions',
                text: 'Are you sure you want to delete these job positions?',
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
                        data: {username : username, job_position_id : job_position_id, transaction : transaction},
                        success: function (response) {
                            if(response === 'Deleted'){
                                show_alert('Delete Multiple Job Positions', 'The job positions have been deleted.', 'success');
    
                                reload_datatable('#job-position-datatable');
                            }
                            else if(response === 'Not Found'){
                                show_alert('Delete Multiple Job Positions', 'The job positions does not exist.', 'info');
                            }
                            else{
                                show_alert('Delete Multiple Job Positions', response, 'error');
                            }
                        }
                    });
                    
                    return false;
                }
            });
        }
        else{
            show_alert('Delete Multiple Job Positions', 'Please select the job positions you want to delete.', 'error');
        }
    });

}