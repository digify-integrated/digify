(function($) {
    'use strict';

    $(function() {
        display_form_details('interface setting form');

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
    });
})(jQuery);