(function ($) {
    "use strict";

    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.nav-bar').addClass('sticky-top ks-header-extended').removeClass('ks-header radius');
            $('.ks-blank').css("width", "100px");

        } else {
            $('.nav-bar').removeClass('sticky-top ks-header-extended').addClass('ks-header radius');
            $('.ks-blank').css("width", "0px");

        }
    });

    
})(jQuery);

