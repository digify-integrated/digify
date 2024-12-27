import { disableButton, enableButton } from '../utilities/form-utilities.js';
import { handleSystemError } from '../modules/system-errors.js';
import { showNotification, setNotification } from '../modules/notifications.js';
import { getDeviceInfo } from '../utilities/helpers.js';

$(document).ready(() => {
    document.querySelectorAll('.otp-input').forEach(input => {
        input.addEventListener('input', () => {
            const maxLength = parseInt(input.getAttribute('maxlength'), 10);
            const currentLength = input.value.length;

            if (currentLength === maxLength) {
                const nextInput = input.nextElementSibling;
                if (nextInput && nextInput.classList.contains('otp-input')) {
                    nextInput.focus();
                }
            }
        });

        input.addEventListener('paste', (e) => {
            e.preventDefault();

            const pastedData = (e.clipboardData || window.clipboardData).getData('text/plain');
            const filteredData = pastedData.replace(/[^a-zA-Z0-9]/g, '');

            filteredData.split('').forEach((char, index) => {
                if (index < 6) {
                    const otpInput = document.querySelector(`#otp_code_${index + 1}`);
                    if (otpInput) otpInput.value = char;
                }
            });
        });

        input.addEventListener('keydown', (e) => {
            if (e.key === 'Backspace' && input.value.length === 0) {
                const prevInput = input.previousElementSibling;
                if (prevInput && prevInput.classList.contains('otp-input')) {
                    prevInput.focus();
                }
            }
        });
    });

    document.getElementById('resend-link').addEventListener('click', () => {
        resetCountdown(60);
    });

    $('#otp-form').validate({
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
        submitHandler: (form, event) => {
            event.preventDefault();

            const transaction = 'otp verification';
            const device_info = getDeviceInfo();

            $.ajax({
                type: 'POST',
                url: './app/Controllers/AuthenticationController.php',
                data: $(form).serialize() + `&transaction=${transaction}&device_info=${device_info}`,
                dataType: 'JSON',
                beforeSend: () => {
                    disableButton('verify');
                },
                success: (response) => {
                    if (response.success) {
                        window.location.href = response.redirectLink;
                    } else {
                        if (response.otpMaxFailedAttempt || response.incorrectOTPCode || response.expiredOTP) {
                            showNotification(response.title, response.message, response.messageType);
                            enableButton('verify');
                        } else {
                            setNotification(response.title, response.message, response.messageType);
                            window.location.href = 'index.php';
                        }
                    }
                },
                error: (xhr, status, error) => {
                    enableButton('verify');
                    handleSystemError(xhr, status, error);
                }
            });

            return false;
        }
    });

    const startCountdown = (countdownValue) => {
        const countdownElement = document.getElementById('countdown');
        const resendLink = document.getElementById('resend-link');

        countdownElement.classList.remove('d-none');
        resendLink.classList.add('d-none');

        const countdownEndTime = Date.now() + countdownValue * 1000;
        sessionStorage.setItem('countdownEndTime', countdownEndTime);

        const countdownTimer = setInterval(() => {
            const remainingTime = Math.ceil((countdownEndTime - Date.now()) / 1000);

            if (remainingTime >= 0) {
                countdownElement.textContent = remainingTime;
            } else {
                clearInterval(countdownTimer);
                sessionStorage.removeItem('countdownEndTime');
                countdownElement.classList.add('d-none');
                resendLink.classList.remove('d-none');
            }
        }, 1000);
    };

    const resetCountdown = (countdownValue) => {
        const user_account_id = $('#user_account_id').val();
        const transaction = 'resend otp';

        const existingEndTime = sessionStorage.getItem('countdownEndTime');
        if (existingEndTime) {
            const remainingTime = Math.ceil((existingEndTime - Date.now()) / 1000);
            if (remainingTime > 0) {
                return;
            }
        }

        const lastRequestTimestamp = sessionStorage.getItem('lastOtpRequest');
        const currentTime = Date.now();
        if (lastRequestTimestamp) {
            const timeDifference = currentTime - lastRequestTimestamp;
            const resendCooldown = 60000; // 1 minute cooldown
            if (timeDifference < resendCooldown) {
                return;
            }
        }

        sessionStorage.setItem('lastOtpRequest', currentTime);

        $.ajax({
            type: 'POST',
            url: './app/Controllers/AuthenticationController.php',
            dataType: 'json',
            data: {
                user_account_id,
                transaction
            },
            beforeSend: () => {
                $('#countdown').removeClass('d-none');
                $('#resend-link').addClass('d-none');
                document.getElementById('countdown').innerHTML = countdownValue;

                startCountdown(countdownValue);
            },
            success: (response) => {
                if (!response.success) {
                    window.location.href = 'index.php';
                    setNotification(response.title, response.message, response.messageType);
                }
            },
            error: (xhr, status, error) => {
                handleSystemError(xhr, status, error);
            }
        });
    };

    const countdownEndTime = sessionStorage.getItem('countdownEndTime');
    if (countdownEndTime) {
        const remainingTime = Math.ceil((countdownEndTime - Date.now()) / 1000);

        if (remainingTime > 0) {
            startCountdown(remainingTime);
        } else {
            sessionStorage.removeItem('countdownEndTime');
        }
    }

    const lastRequestTimestamp = sessionStorage.getItem('lastOtpRequest');
    if (lastRequestTimestamp) {
        const currentTime = Date.now();
        const timeDifference = currentTime - lastRequestTimestamp;
        const resendCooldown = 60000;

        if (timeDifference < resendCooldown) {
            const timeLeft = Math.ceil((resendCooldown - timeDifference) / 1000);
            $('#resend-link').addClass('d-none');
        }
    }
});