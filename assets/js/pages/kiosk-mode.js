(function($) {
    'use strict';

    initialize_click_events();

})(jQuery);

function initialize_click_events(){
    var username = $('#username').text();

    $(document).on('click','#scan-badge',function() {
        generate_modal('scan badge form', 'Scan Badge', 'LG' , '1', '0', 'element', '', '0', username);
    });
}