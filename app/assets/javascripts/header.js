$(document).on('ready page:load', function() {
  var shrinkHeader = 200;

  $(window).scroll(function() {
    var scroll = getCurrentScroll();

    if (scroll >= shrinkHeader) {
      $('.navbar').addClass('shrink');
    }
    else {
      $('.navbar').removeClass('shrink');
    }
  });

  function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
  }
});
