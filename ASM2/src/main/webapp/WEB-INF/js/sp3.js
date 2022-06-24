$(document).ready(function() {
    $('#dsLookbook').owlCarousel({
        loop: true,
        autoplay: true,
        autoplayTimeout: 4000,
        autoplayHoverPause: false,
        responsive: {
            0: {
                items: 1,
                nav: false,
                stagePadding: 40
            },
            600: {
                items: 1,
                stagePadding: 40,
                nav: false
            },
            1000: {
                items: 2,
                nav: false,
                loop: true
            }
        }
    });

    $('.dsHinhSanPham').owlCarousel({
        loop: false,
        autoplay: false,
        dots: true,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            600: {
                items: 1,
                nav: false
            },
            1000: {
                items: 1,
                nav: false,
            }
        }
    });
    var dots = $('.owl-dots').css('position', 'absolute').css('bottom', '5px');
    dots.css('left', 'calc(50% - ' + dots.width() / 2 + 'px)');

    var dot = $('.owl-dot span').css('width', '5px').css('height', '5px');

    $('.dsHinhSanPham').mouseover(function() {
        $(this).trigger('to.owl.carousel', [1, 700]);
    }).mouseleave(function() {
        //reset from 1
        $(this).trigger('to.owl.carousel', [0, 700]);
    });

});