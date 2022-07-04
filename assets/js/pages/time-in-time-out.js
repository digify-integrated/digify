(function($) {
    'use strict';

    $(function() {
        initialize_click_events();
    });
})(jQuery);

function initialize_click_events(){
    var username = $('#username').text();

    $(document).on('click','#time-in',function() {
        generate_modal('time in form', 'Time In', 'R' , '1', '1', 'form', 'time-in-form', '1', username);
    });

    $(document).on('click','#time-out',function() {
        var attendance_id = $(this).data('attendance-id');

        sessionStorage.setItem('attendance_id', attendance_id);
        
        generate_modal('time out form', 'Time Out', 'R' , '1', '1', 'form', 'time-out-form', '1', username);
    });

}