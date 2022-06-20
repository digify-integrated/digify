(function($) {
    'use strict';

    $(function() {
        display_form_details('interface setting form');
        display_form_details('mail configuration form');
        display_form_details('zoom integration form');

        $('#interface-setting-form').validate({
            submitHandler: function (form) {
                var transaction = 'submit interface setting';
                var username = $('#username').text();
                
                var formData = new FormData(form);
                formData.append('username', username);
                formData.append('transaction', transaction);

                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function(){
                        document.getElementById('submit-interface-setting-form').disabled = true;
                        $('#submit-interface-setting-form').html('<div class="spinner-border spinner-border-sm text-light" role="status"><span rclass="sr-only"></span></div>');
                    },
                    success: function (response) {
                        if(response === 'Updated'){
                            show_alert_event('Update Interface Setting Success', 'Your interface setting has been updated.', 'success', 'reload');
                        }
                        else{
                            show_alert('Update Interface Setting Error', response, 'error');
                        }
                    },
                    complete: function(){
                        document.getElementById('submit-interface-setting-form').disabled = false;
                        $('#submit-interface-setting-form').html('Submit');
                    }
                });
                return false;
            },
            errorPlacement: function(label, element) {
                if((element.hasClass('select2') || element.hasClass('form-select2')) && element.next('.select2-container').length) {
                    label.insertAfter(element.next('.select2-container'));
                }
                else if(element.parent('.input-group').length){
                    label.insertAfter(element.parent());
                }
                else{
                    label.insertAfter(element);
                }
            },
            highlight: function(element) {
                $(element).parent().addClass('has-danger');
                $(element).addClass('form-control-danger');
            },
            success: function(label,element) {
                $(element).parent().removeClass('has-danger')
                $(element).removeClass('form-control-danger')
                label.remove();
            }
        });

        $('#email-setup-form').validate({
            submitHandler: function (form) {
                var transaction = 'submit mail configuration';
                var username = $('#username').text();

                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: $(form).serialize() + '&username=' + username + '&transaction=' + transaction,
                    beforeSend: function(){
                        document.getElementById('submit-email-setup-form').disabled = true;
                        $('#submit-email-setup-form').html('<div class="spinner-border spinner-border-sm text-light" role="status"><span rclass="sr-only"></span></div>');
                    },
                    success: function (response) {
                        if(response === 'Updated'){
                            show_alert_event('Update Mail Configuration Success', 'The mail configuration has been updated.', 'success', 'reload');
                        }
                        else{
                            show_alert('Update Mail Configuration Error', response, 'error');
                        }
                    },
                    complete: function(){
                        document.getElementById('submit-email-setup-form').disabled = false;
                        $('#submit-email-setup-form').html('Submit');
                    }
                });
                return false;
            },
            rules: {
                mail_host: {
                    required: true
                },
                port: {
                    required: true
                },
                mail_user: {
                    required: true
                },
                mail_encryption: {
                    required: true
                },
                mail_from_name: {
                    required: true
                },
                mail_from_email: {
                    required: true
                },
            },
            messages: {
                mail_host: {
                    required: 'Please enter the mail host',
                },
                port: {
                    required: 'Please enter the port',
                },
                mail_user: {
                    required: 'Please enter the mail user',
                },
                mail_encryption: {
                    required: 'Please choose the mail encryption',
                },
                mail_from_name: {
                    required: 'Please enter the mail from name',
                },
                mail_from_email: {
                    required: 'Please enter the mail from email',
                },
            },
            errorPlacement: function(label, element) {
                if((element.hasClass('select2') || element.hasClass('form-select2')) && element.next('.select2-container').length) {
                    label.insertAfter(element.next('.select2-container'));
                }
                else if(element.parent('.input-group').length){
                    label.insertAfter(element.parent());
                }
                else{
                    label.insertAfter(element);
                }
            },
            highlight: function(element) {
                $(element).parent().addClass('has-danger');
                $(element).addClass('form-control-danger');
            },
            success: function(label,element) {
                $(element).parent().removeClass('has-danger')
                $(element).removeClass('form-control-danger')
                label.remove();
            }
        });

        $('#zoom-integration-form').validate({
            submitHandler: function (form) {
                var transaction = 'submit zoom integration';
                var username = $('#username').text();

                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: $(form).serialize() + '&username=' + username + '&transaction=' + transaction,
                    beforeSend: function(){
                        document.getElementById('submit-zoom-integration-form').disabled = true;
                        $('#submit-zoom-integration-form').html('<div class="spinner-border spinner-border-sm text-light" role="status"><span rclass="sr-only"></span></div>');
                    },
                    success: function (response) {
                        if(response === 'Updated'){
                            show_alert_event('Update Zoom Integration Success', 'The zoom integration has been updated.', 'success', 'reload');
                        }
                        else{
                            show_alert('Update Zoom Integration Error', response, 'error');
                        }
                    },
                    complete: function(){
                        document.getElementById('submit-zoom-integration-form').disabled = false;
                        $('#submit-zoom-integration-form').html('Submit');
                    }
                });
                return false;
            },
            rules: {
                api_key: {
                    required: true
                },
                api_secret: {
                    required: true
                },
            },
            messages: {
                api_key: {
                    required: 'Please enter the API Key',
                },
                api_secret: {
                    required: 'Please enter the API Secret',
                },
            },
            errorPlacement: function(label, element) {
                if((element.hasClass('select2') || element.hasClass('form-select2')) && element.next('.select2-container').length) {
                    label.insertAfter(element.next('.select2-container'));
                }
                else if(element.parent('.input-group').length){
                    label.insertAfter(element.parent());
                }
                else{
                    label.insertAfter(element);
                }
            },
            highlight: function(element) {
                $(element).parent().addClass('has-danger');
                $(element).addClass('form-control-danger');
            },
            success: function(label,element) {
                $(element).parent().removeClass('has-danger')
                $(element).removeClass('form-control-danger')
                label.remove();
            }
        });
    });
})(jQuery);