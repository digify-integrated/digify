import { disableButton, enableButton } from '../utilities/form-utilities.js';
import { handleSystemError } from '../modules/system-errors.js';
import { showNotification, setNotification } from '../modules/notifications.js';

$(document).ready(function () {
    $('#forgot-password-form').validate({
        rules: {
            email: {
                required: true,
            }
        },
        messages: {
            email: {
                required: 'Enter the email',
            }
        },
        errorPlacement: (error, element) => {
            const $inputGroup = element.closest('.input-group');
    
            $inputGroup.length
                ? $inputGroup.after(error)
                : element.hasClass('select2-hidden-accessible')
                    ? element.next().find('.select2-selection').after(error)
                    : element.after(error);
        },
        highlight: (element) => {
            const $element = $(element);
            const $target = $element.hasClass('select2-hidden-accessible')
                ? $element.next().find('.select2-selection')
                : $element;
            $target.addClass('is-invalid');
        },
        unhighlight: (element) => {
            const $element = $(element);
            const $target = $element.hasClass('select2-hidden-accessible')
                ? $element.next().find('.select2-selection')
                : $element;
            $target.removeClass('is-invalid');
        },
        submitHandler: async (form, event) => {
            event.preventDefault();

            const transaction = 'forgot password';

            $.ajax({
                type: 'POST',
                url: './app/Controllers/AuthenticationController.php',
                data: $(form).serialize() + '&transaction=' + transaction,
                dataType: 'JSON',
                beforeSend: function() {
                    disableButton('forgot-password');
                },
                success: function(response) {
                    if (response.success) {
                        setNotification(response.title, response.message, response.messageType);
                        
                        window.location.href = 'index.php';
                    } 
                    else {
                        showNotification(response.title, response.message, response.messageType);
                        enableButton('forgot-password');
                    }
                },
                error: function(xhr, status, error) {
                    enableButton('forgot-password');
                    handleSystemError(xhr, status, error);
                }
            });

            return false;
        }
    });
});