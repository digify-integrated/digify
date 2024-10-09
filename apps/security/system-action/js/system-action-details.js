(function($) {
    'use strict';

    $(function() {
        displayDetails('get system action details');

        if($('#system-action-form').length){
            systemActionForm();
        }

        $(document).on('click','#edit-details',function() {
            displayDetails('get system action details');
        });

        $(document).on('click','#delete-system-action',function() {
            const system_action_id = $('#details-id').text();
            const page_link = document.getElementById('page-link').getAttribute('href'); 
            const transaction = 'delete system action';
    
            Swal.fire({
                title: 'Confirm System Action Deletion',
                text: 'Are you sure you want to delete this system action?',
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
                        url: 'apps/security/system-action/controller/system-action-controller.php',
                        dataType: 'json',
                        data: {
                            system_action_id : system_action_id, 
                            transaction : transaction
                        },
                        success: function (response) {
                            if (response.success) {
                                setNotification(response.title, response.message, response.messageType);
                                window.location = page_link;
                            }
                            else {
                                if (response.isInactive || response.userNotExist || response.userInactive || response.userLocked || response.sessionExpired) {
                                    setNotification(response.title, response.message, response.messageType);
                                    window.location = 'logout.php?logout';
                                }
                                else if (response.notExist) {
                                    setNotification(response.title, response.message, response.messageType);
                                    window.location = page_link;
                                }
                                else {
                                    showNotification(response.title, response.message, response.messageType);
                                }
                            }
                        },
                        error: function(xhr, status, error) {
                            handleSystemError(xhr, status, error);
                        }
                    });
                    return false;
                }
            });
        });

        if($('#log-notes-main').length){
            const system_action_id = $('#details-id').text();

            logNotesMain('system_action', system_action_id);
        }

        if($('#internal-notes').length){
            const system_action_id = $('#details-id').text();

            internalNotes('system_action', system_action_id);
        }

        if($('#internal-notes-form').length){
            const system_action_id = $('#details-id').text();

            internalNotesForm('system_action', system_action_id);
        }
    });
})(jQuery);

function systemActionForm(){
    $('#system-action-form').validate({
        rules: {
            system_action_name: {
                required: true
            },
            menu_group_id: {
                required: true
            },
            order_sequence: {
                required: true
            }
        },
        messages: {
            system_action_name: {
                required: 'Enter display name'
            },
            menu_group_id: {
                required: 'Choose the menu group'
            },
            order_sequence: {
                required: 'Enter the order sequence'
            }
        },
        errorPlacement: function(error, element) {
            showNotification('Action Needed: Issue Detected', error, 'error', 2500);
        },
        highlight: function(element) {
            const $element = $(element);
            const $target = $element.hasClass('select2-hidden-accessible') ? $element.next().find('.select2-selection') : $element;
            $target.addClass('is-invalid');
        },
        unhighlight: function(element) {
            const $element = $(element);
            const $target = $element.hasClass('select2-hidden-accessible') ? $element.next().find('.select2-selection') : $element;
            $target.removeClass('is-invalid');
        },
        submitHandler: function(form) {
            const system_action_id = $('#details-id').text();
            const page_link = document.getElementById('page-link').getAttribute('href'); 
            const transaction = 'update system action';
          
            $.ajax({
                type: 'POST',
                url: 'apps/security/system-action/controller/system-action-controller.php',
                data: $(form).serialize() + '&transaction=' + transaction + '&system_action_id=' + encodeURIComponent(system_action_id),
                dataType: 'json',
                beforeSend: function() {
                    disableFormSubmitButton('submit-data');
                },
                success: function (response) {
                    if (response.success) {
                        showNotification(response.title, response.message, response.messageType);
                        displayDetails('get system action details');
                        $('#system-action-modal').modal('hide');
                    }
                    else {
                        if (response.isInactive || response.userNotExist || response.userInactive || response.userLocked || response.sessionExpired) {
                            setNotification(response.title, response.message, response.messageType);
                            window.location = 'logout.php?logout';
                        }
                        else if (response.notExist) {
                            setNotification(response.title, response.message, response.messageType);
                            window.location = page_link;
                        }
                        else {
                            showNotification(response.title, response.message, response.messageType);
                        }
                    }
                },
                error: function(xhr, status, error) {
                    handleSystemError(xhr, status, error);
                },
                complete: function() {
                    enableFormSubmitButton('submit-data');
                    logNotesMain('system_action', system_action_id);
                }
            });
        
            return false;
        }
    });
}

function displayDetails(transaction){
    switch (transaction) {
        case 'get system action details':
            var system_action_id = $('#details-id').text();
            const page_link = document.getElementById('page-link').getAttribute('href'); 
            
            $.ajax({
                url: 'apps/security/system-action/controller/system-action-controller.php',
                method: 'POST',
                dataType: 'json',
                data: {
                    system_action_id : system_action_id, 
                    transaction : transaction
                },
                beforeSend: function(){
                    resetModalForm('system-action-form');
                },
                success: function(response) {
                    if (response.success) {
                        $('#system_action_name').val(response.systemActionName);
                        $('#system_action_description').val(response.systemActionDescription);
                        
                        $('#system_action_name_summary').text(response.systemActionName);
                        $('#system_action_description_summary').text(response.systemActionDescription);
                    } 
                    else {
                        if (response.isInactive || response.userNotExist || response.userInactive || response.userLocked || response.sessionExpired) {
                            setNotification(response.title, response.message, response.messageType);
                            window.location = 'logout.php?logout';
                        }
                        else if (response.notExist) {
                            setNotification(response.title, response.message, response.messageType);
                            window.location = page_link;
                        }
                        else {
                            showNotification(response.title, response.message, response.messageType);
                        }
                    }
                },
                error: function(xhr, status, error) {
                    handleSystemError(xhr, status, error);
                }
            });
            break;
    }
}