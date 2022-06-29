(function($) {
    'use strict';

    $(function() {
        display_form_details('attendance setting form');
        initialize_on_change_events();

        $('#attendance-setting-form').validate({
            submitHandler: function (form) {
                var transaction = 'submit attendance setting';
                var username = $('#username').text();

                var attendance_creation_recommendation_exception = $('#attendance_creation_recommendation_exception').val();
                var attendance_creation_approval_exception = $('#attendance_creation_approval_exception').val();
                var attendance_adjustment_recommendation_exception = $('#attendance_adjustment_recommendation_exception').val();
                var attendance_adjustment_approval_exception = $('#attendance_adjustment_approval_exception').val();
                
                document.getElementById('attendance_creation_recommendation_exception').disabled = false;
                document.getElementById('attendance_creation_approval_exception').disabled = false;
                document.getElementById('attendance_adjustment_recommendation_exception').disabled = false;
                document.getElementById('attendance_adjustment_approval_exception').disabled = false;

                $.ajax({
                    type: 'POST',
                    url: 'controller.php',
                    data: $(form).serialize() + '&username=' + username + '&transaction=' + transaction + '&attendance_creation_recommendation_exception=' + attendance_creation_recommendation_exception + '&attendance_creation_approval_exception=' + attendance_creation_approval_exception + '&attendance_adjustment_recommendation_exception=' + attendance_adjustment_recommendation_exception + '&attendance_adjustment_approval_exception=' + attendance_adjustment_approval_exception,
                    beforeSend: function(){
                        document.getElementById('submit-attendance-setting-form').disabled = true;
                        $('#submit-attendance-setting-form').html('<div class="spinner-border spinner-border-sm text-light" role="status"><span rclass="sr-only"></span></div>');
                    },
                    success: function (response) {
                        if(response === 'Updated'){
                            show_alert_event('Update Attendance Setting Success', 'The attendance setting has been updated.', 'success', 'reload');
                        }
                        else{
                            show_alert('Update Attendance Setting Error', response, 'error');
                        }
                    },
                    complete: function(){
                        document.getElementById('submit-attendance-setting-form').disabled = false;
                        $('#submit-attendance-setting-form').html('Submit');
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

function initialize_on_change_events(){
    $(document).on('change','#attendance_creation_recommendation',function() {
        $('#attendance_creation_recommendation_exception').val('').change();

        if(this.checked){
            document.getElementById('attendance_creation_recommendation_exception').disabled = false;
        }
        else{
            document.getElementById('attendance_creation_recommendation_exception').disabled = true;
        }
    });

    $(document).on('change','#attendance_creation_approval',function() {
        $('#attendance_creation_approval_exception').val('').change();

        if(this.checked){
            document.getElementById('attendance_creation_approval_exception').disabled = false;
        }
        else{
            document.getElementById('attendance_creation_approval_exception').disabled = true;
        }
    });

    $(document).on('change','#attendance_adjustment_recommendation',function() {
        $('#attendance_adjustment_recommendation_exception').val('').change();

        if(this.checked){
            document.getElementById('attendance_adjustment_recommendation_exception').disabled = false;
        }
        else{
            document.getElementById('attendance_adjustment_recommendation_exception').disabled = true;
        }
    });

    $(document).on('change','#attendance_adjustment_approval',function() {
        $('#attendance_adjustment_approval_exception').val('').change();

        if(this.checked){
            document.getElementById('attendance_adjustment_approval_exception').disabled = false;
        }
        else{
            document.getElementById('attendance_adjustment_approval_exception').disabled = true;
        }
    });

}