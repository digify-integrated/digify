(function($) {
    'use strict';

    $(function() {
        if($('#app-module-table').length){
            appModuleTable('#app-module-table');
        }

        $(document).on('click','#submit-export',function() {
            exportData();
        });

        $(document).on('click','.delete-app-module',function() {
            const app_module_id = $(this).data('app-module-id');
            const transaction = 'delete app module';
    
            Swal.fire({
                title: 'Confirm App Module Deletion',
                text: 'Are you sure you want to delete this app module?',
                icon: 'warning',
                showCancelButton: !0,
                confirmButtonText: 'Delete',
                cancelButtonText: 'Cancel',
                customClass: {
                    confirmButton: 'btn btn-danger mt-2',
                    cancelButton: 'btn btn-secondary ms-2 mt-2'
                },
                buttonsStyling: !1
            }).then(function(result) {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: 'components/app-module/controller/app-module-controller.php',
                        dataType: 'json',
                        data: {
                            app_module_id : app_module_id, 
                            transaction : transaction
                        },
                        success: function (response) {
                            if (response.success) {
                                showNotification(response.title, response.message, response.messageType);
                                reloadDatatable('#app-module-table');
                            }
                            else {
                                if (response.isInactive || response.userNotExist || response.userInactive || response.userLocked || response.sessionExpired) {
                                    setNotification(response.title, response.message, response.messageType);
                                    window.location = 'logout.php?logout';
                                }
                                else if (response.notExist) {
                                    setNotification(response.title, response.message, response.messageType);
                                    reloadDatatable('#app-module-table');
                                }
                                else {
                                    showNotification(response.title, response.message, response.messageType);
                                }
                            }
                        },
                        error: function(xhr, status, error) {
                            var fullErrorMessage = `XHR status: ${status}, Error: ${error}`;
                            if (xhr.responseText) {
                                fullErrorMessage += `, Response: ${xhr.responseText}`;
                            }
                            showErrorDialog(fullErrorMessage);
                        }
                    });
                    return false;
                }
            });
        });

        $(document).on('click','#delete-app-module',function() {
            let app_module_id = [];
            const transaction = 'delete multiple app module';

            $('.datatable-checkbox-children').each((index, element) => {
                if ($(element).is(':checked')) {
                    app_module_id.push(element.value);
                }
            });
    
            if(app_module_id.length > 0){
                Swal.fire({
                    title: 'Confirm Multiple App Modules Deletion',
                    text: 'Are you sure you want to delete these app modules?',
                    icon: 'warning',
                    showCancelButton: !0,
                    confirmButtonText: 'Delete',
                    cancelButtonText: 'Cancel',
                    customClass: {
                        confirmButton: 'btn btn-danger mt-2',
                        cancelButton: 'btn btn-secondary ms-2 mt-2'
                    },
                    buttonsStyling: !1
                }).then(function(result) {
                    if (result.value) {
                        $.ajax({
                            type: 'POST',
                            url: 'apps/security/app-module/controller/app-module-controller.php',
                            dataType: 'json',
                            data: {
                                app_module_id: app_module_id,
                                transaction : transaction
                            },
                            success: function (response) {
                                if (response.success) {
                                    showNotification(response.title, response.message, response.messageType);
                                    reloadDatatable('#app-module-table');
                                }
                                else {
                                    if (response.isInactive || response.userNotExist || response.userInactive || response.userLocked || response.sessionExpired) {
                                        setNotification(response.title, response.message, response.messageType);
                                        window.location = 'logout.php?logout';
                                    }
                                    else {
                                        showNotification(response.title, response.message, response.messageType);
                                    }
                                }
                            },
                            error: function(xhr, status, error) {
                                handleSystemError(xhr, status, error);
                            },
                            complete: function(){
                                toggleHideActionDropdown();
                            }
                        });
                        
                        return false;
                    }
                });
            }
            else{
                showNotification('Deletion Multiple App Module Error', 'Please select the app modules you wish to delete.', 'danger');
            }
        });

        $(document).on('click','#export-data',function() {
            generateDropdownOptions('export options');
        });

        $('#datatable-search').on('keyup', function () {
            var table = $('#app-module-table').DataTable();
            table.search(this.value).draw();
        });

        $('#datatable-length').on('change', function() {
            var table = $('#app-module-table').DataTable();
            var length = $(this).val(); 
            table.page.len(length).draw();
        });
    });
})(jQuery);

function exportData() {
    const transaction = 'export data';
    var export_to = $('#export_to').val();
    var table_column = $('#table_column').val();

    let export_id = [];

    $('.datatable-checkbox-children').each((index, element) => {
        if ($(element).is(':checked')) {
            export_id.push(element.value);
        }
    });
    
    $.ajax({
        type: 'POST',
        url: 'apps/security/app-module/controller/app-module-controller.php',
        data: {
            transaction: transaction,
            export_id: export_id,
            export_to: export_to,
            table_column: table_column,
        },
        xhrFields: {
            responseType: 'blob' // Expect a file blob from the server
        },
        beforeSend: function() {
            disableFormSubmitButton('submit-export');
        },
        success: function (response, status, xhr) {
            var filename = "";                   
            var disposition = xhr.getResponseHeader('Content-Disposition');

            if (disposition && disposition.indexOf('attachment') !== -1) {
                var matches = /filename="(.+)"/.exec(disposition);
                if (matches != null && matches[1]) {
                    filename = matches[1];
                }
            }

            var blob = new Blob([response], { type: xhr.getResponseHeader('Content-Type') });
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = filename || "export." + export_to;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        },
        error: function(xhr, status, error) {
            handleSystemError(xhr, status, error);
        },
        complete: function() {
            enableFormSubmitButton('submit-export');
        }
    });
}


function appModuleTable(datatable_name) {
    toggleHideActionDropdown();

    const type = 'app module table';
    const page_id = $('#page-id').val();
    const page_link = document.getElementById('page-link').getAttribute('href');

    const columns = [ 
        { data: 'CHECK_BOX' },
        { data: 'APP_MODULE_NAME' },
        { data: 'LINK', visible: false }
    ];

    const columnDefs = [
        { width: '1%', bSortable: false, targets: 0 },
        { width: 'auto', targets: 1 },
        { targets: [2], visible: false }
    ];

    const lengthMenu = [[10, 5, 25, 50, 100, -1], [10, 5, 25, 50, 100, 'All']];

    const settings = {
        ajax: { 
            url: 'apps/security/app-module/view/_app_module_generation.php',
            method: 'POST',
            dataType: 'json',
            data: {
                type: type,
                page_id: page_id,
                page_link: page_link
            },
            dataSrc: '',
            error: function(xhr, status, error) {
                handleSystemError(xhr, status, error);
            }
        },
        dom: 'Brtip',
        lengthChange: false,
        order: [[1, 'asc']],
        columns: columns,
        columnDefs: columnDefs,
        lengthMenu: lengthMenu,
        language: {
            emptyTable: 'No data found',
            sLengthMenu: '_MENU_',
            info: '_START_ - _END_ of _TOTAL_ items',
            loadingRecords: 'Just a moment while we fetch your data...'
        },
        fnDrawCallback: function(oSettings) {
            readjustDatatableColumn();
            
            $(`${datatable_name} tbody`).on('click', 'tr td:nth-child(n+2)', function () {
                const rowData = $(datatable_name).DataTable().row($(this).closest('tr')).data();
                if (rowData && rowData.LINK) {
                    window.location.href = rowData.LINK;
                }
            });
        }
    };

    destroyDatatable(datatable_name);
    $(datatable_name).dataTable(settings);
}

function generateDropdownOptions(type){
    switch (type) {
        case 'export options':
            var table_name = 'app_module';

            $.ajax({
                url: 'components/view/_export_generation.php',
                method: 'POST',
                dataType: 'json',
                data: {
                    type : type,
                    table_name : table_name
                },
                success: function(response) {
                    var select = document.getElementById('table_column');

                    select.options.length = 0;

                    response.forEach(function(opt) {
                        var option = new Option(opt.text, opt.id);
                        select.appendChild(option);
                    });
                },
                error: function(xhr, status, error) {
                    var fullErrorMessage = `XHR status: ${status}, Error: ${error}`;
                    if (xhr.responseText) {
                        fullErrorMessage += `, Response: ${xhr.responseText}`;
                    }
                    showErrorDialog(fullErrorMessage);
                },
                complete: function(){
                    if($('#table_column').length){
                        $('#table_column').bootstrapDualListbox({
                            nonSelectedListLabel: 'Non-selected',
                            selectedListLabel: 'Selected',
                            preserveSelectionOnMove: 'moved',
                            moveOnSelect: false,
                            helperSelectNamePostfix: false,
                            sortByInputOrder: false     
                        });

                        $('#table_column').bootstrapDualListbox('refresh', true);

                        initializeDualListBoxIcon();
                    }
                }
            });
            break;
    }
}