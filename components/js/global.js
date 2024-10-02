(function($) {
    'use strict';

    $(function() {
        checkNotification();
        passwordAddOn();
        maxLength();

        sessionStorage.setItem('Layout', 'vertical');
        sessionStorage.setItem('Direction', 'ltr');

        $(document).on('click','#discard-create',function() {
            const page_link = document.getElementById('page-link').getAttribute('href'); 
            discardCreate(page_link);
        });

        $(document).on('click','#copy-error-message',function() {
            copyToClipboard('error-dialog');
        });

        $(document).on('click','#datatable-checkbox',function() {
            var status = $(this).is(':checked') ? true : false;
            $('.datatable-checkbox-children').prop('checked',status);
    
            toggleActionDropdown();
        });

        $(document).on('click','.datatable-checkbox-children',function() {
            toggleActionDropdown();
        });
    });
})(jQuery);

function discardCreate(windows_location){
    Swal.fire({
        title: 'Discard Changes Confirmation',
        text: 'You are about to discard your changes. Proceeding will permanently erase any unsaved modifications. Are you sure you want to continue?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Discard',
        cancelButtonText: 'Cancel',
        customClass: {
            confirmButton: 'btn btn-warning mt-2',
            cancelButton: 'btn btn-secondary ms-2 mt-2'
        },
        buttonsStyling: false
    }).then(function(result) {
        if (result.value) {
            window.location = windows_location;
        }
    });
}

function passwordAddOn(){
    if ($('.password-addon').length) {
        $('.password-addon').on('click', function() {
            const inputField = $(this).siblings('input');
            const eyeIcon = $(this).find('i');

            if (inputField.length) {
                const isPassword = inputField.attr('type') === 'password';
                inputField.attr('type', isPassword ? 'text' : 'password');
                eyeIcon.toggleClass('ti-eye ti-eye-off');
            }
        });

        $('.password-addon').attr('tabindex', -1); // Set tabIndex in one go
    }
}

function maxLength(){
    if ($('[maxlength]').length) {
        $('[maxlength]').maxlength({
            alwaysShow: true,
            warningClass: 'badge rounded-pill bg-info fs-1 mt-0',
            limitReachedClass: 'badge rounded-pill bg-danger fs-1 mt-0',
        });
    }
}

function checkOptionExist(element, option) {
    $(element).val(option).trigger('change');
}

function initializeDualListBoxIcon(){
    $('.moveall i').removeClass().addClass('ti ti-chevron-right');
    $('.removeall i').removeClass().addClass('ti ti-chevron-left');
    $('.move i').removeClass().addClass('ti ti-chevron-right');
    $('.remove i').removeClass().addClass('ti ti-chevron-left');
}

function resetModalForm(form_id) {
    var form = document.getElementById(form_id);

    $(form).find('.select2').each(function() {
        $(this).val('').trigger('change.select2');
    });
  
    form.querySelectorAll('.is-invalid').forEach(function(element) {
        element.classList.remove('is-invalid');
    });

    form.reset();
}

function reloadDatatable(datatable) {
    toggleHideActionDropdown();
    $(datatable).DataTable().ajax.reload(null, false);
}

function destroyDatatable(datatable) {
    $(datatable).DataTable().clear().destroy();
}

function clearDatatable(datatable) {
    $(datatable).DataTable().clear().draw();
}

function readjustDatatableColumn() {
    const adjustDataTable = () => {
        const tables = $.fn.dataTable.tables({ visible: true, api: true });
        tables.columns.adjust().fixedColumns().relayout();
    };

    $('a[data-bs-toggle="tab"], a[data-bs-toggle="pill"], #System-Modal').on('shown.bs.tab shown.bs.modal', adjustDataTable);
}

function toggleActionDropdown(){
    const inputElements = Array.from(document.querySelectorAll('.datatable-checkbox-children'));
    const multipleAction = $('.action-dropdown');
    const checkedValue = inputElements.filter(chk => chk.checked).length;

    multipleAction.toggleClass('d-none', checkedValue === 0);
}

function toggleHideActionDropdown(){
    $('.action-dropdown').addClass('d-none');
    $('#datatable-checkbox').prop('checked', false);
}

function handleColorTheme(e) {
    $('html').attr('data-color-theme', e);
    $(e).prop('checked', !0);
}

function copyToClipboard(elementID) {
    const text = document.getElementById(elementID)?.textContent || '';

    if (!text) {
        showNotification('Copy Error', 'No text found', 'danger');
        return;
    }

    navigator.clipboard.writeText(text)
        .then(() => showNotification('Copy Successful', 'Text copied to clipboard', 'success'))
        .catch(() => showNotification('Copy Error', 'Failed to copy text', 'danger'));
}

function showErrorDialog(error){
    const errorDialogElement = document.getElementById('error-dialog');

    if (errorDialogElement) {
        errorDialogElement.innerHTML = error;
        $('#system-error-modal').modal('show');
    }
    else {
        console.error('Error dialog element not found.');
    }    
}

function updateFormSubmitButton(buttonId, disabled) {
    try {
        const submitButton = document.querySelector(`#${buttonId}`);
    
        if (submitButton) {
            submitButton.disabled = disabled;
        }
        else {
            console.error(`Button with ID '${buttonId}' not found.`);
        }
    }
    catch (error) {
        console.error(error);
    }
}

function disableFormSubmitButton(buttonId) {
    updateFormSubmitButton(buttonId, true);
}

function enableFormSubmitButton(buttonId) {
    updateFormSubmitButton(buttonId, false);
}

function handleSystemError(xhr, status, error) {
    let fullErrorMessage = `XHR status: ${status}, Error: ${error}${xhr.responseText ? `, Response: ${xhr.responseText}` : ''}`;
    showErrorDialog(fullErrorMessage);
}

function showNotification(notificationTitle, notificationMessage, notificationType, timeOut = 2000) {
    const validNotificationTypes = ['success', 'info', 'warning', 'error'];
    const isDuplicate = isDuplicateNotification(notificationMessage);

    if (!validNotificationTypes.includes(notificationType)) {
        console.error('Invalid notification type:', notificationType);
        return;
    }

    const toastrOptions = {
        closeButton: true,
        progressBar: true,
        newestOnTop: false,
        preventDuplicates: true,
        preventOpenDuplicates: true,
        positionClass: 'toast-top-right',
        timeOut: timeOut,
        showMethod: 'fadeIn',
        hideMethod: 'fadeOut',
        escapeHtml: false
    };

    if (!isDuplicate) {
        toastr.options = toastrOptions;
        toastr[notificationType](notificationMessage, notificationTitle);
    }
}

function isDuplicateNotification(message) {
    let isDuplicate = false;
    
    $('.toast').each(function() {
        if ($(this).find('.toast-message').text() === message[0].innerText) {
            isDuplicate = true;
            return false;
        }
    });

    return isDuplicate;
}
  
function setNotification(notificationTitle, notificationMessage, notificationType){
    sessionStorage.setItem('notificationTitle', notificationTitle);
    sessionStorage.setItem('notificationMessage', notificationMessage);
    sessionStorage.setItem('notificationType', notificationType);
}
  
function checkNotification() {
    const { 
        'notificationTitle': notificationTitle, 
        'notificationMessage': notificationMessage, 
        'notificationType': notificationType 
    } = sessionStorage;
    
    if (notificationTitle && notificationMessage && notificationType) {
        sessionStorage.removeItem('notificationTitle');
        sessionStorage.removeItem('notificationMessage');
        sessionStorage.removeItem('notificationType');

        showNotification(notificationTitle, notificationMessage, notificationType);
    }
}

function logNotesMain(databaseTable, referenceID){
    const type = 'log notes main';

    $.ajax({
        type: 'POST',
        url: 'components/view/_log_notes_generation.php',
        dataType: 'json',
        data: { type: type, 'database_table': databaseTable, 'reference_id': referenceID },
        success: function (result) {
            document.getElementById('log-notes-main').innerHTML = result[0].LOG_NOTE;
        }
    });
}

function internalNotes(databaseTable, referenceID){
    const type = 'internal notes';

    $.ajax({
        type: 'POST',
        url: 'components/view/_internal_notes_generation.php',
        dataType: 'json',
        data: { type: type, 'database_table': databaseTable, 'reference_id': referenceID },
        success: function (result) {
            document.getElementById('internal-notes').innerHTML = result[0].INTERNAL_NOTES;
        }
    });
}

function internalNotesForm(databaseTable, referenceID){
    $('#internal-notes-form').validate({
        rules: {
            internal_note: {
                required: true
            }
        },
        messages: {
            internal_note: {
                required: 'Enter the internal notes'
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
            const transaction = 'add internal notes';
            
            var formData = new FormData(form);
            formData.append('transaction', transaction);
            formData.append('database_table', databaseTable);
            formData.append('reference_id', referenceID);
          
            $.ajax({
                type: 'POST',
                url: 'components/global/controller/internal-notes-controller.php',
                data: formData,
                processData: false,
                contentType: false,
                dataType: 'json',
                beforeSend: function() {
                    disableFormSubmitButton('submit-internal-notes');
                },
                success: function (response) {
                    if (response.success) {
                        showNotification(response.title, response.message, response.messageType);
                        internalNotes(databaseTable, referenceID);
                        $('#internal-notes-modal').modal('hide');
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
                    enableFormSubmitButton('submit-internal-notes');
                    resetModalForm('internal-notes-form');
                }
            });
        
            return false;
        }
    });
}