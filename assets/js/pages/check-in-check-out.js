(function($) {
    'use strict';

    $(function() {
        initialize_click_events();
    });
})(jQuery);

function initialize_click_events(){
    var username = $('#username').text();

    $(document).on('click','#check-in',function() {
        generate_modal('check in form', 'Check In', 'R' , '1', '1', 'form', 'check-in-form', '1', username);
    });

    $(document).on('click','.check-out',function() {
        var attendance_id = $(this).data('attendance-id');

        sessionStorage.setItem('attendance_id', attendance_id);
        
        generate_modal('check out form', 'Check Out', 'R' , '1', '1', 'form', 'check-Out-form', '1', username);
    });

}