jQuery(document).ready(function($) {
  $('.button-collapse').sideNav();

  $('.news-container li').hover(function() {

  });

  // TODO Passer à Toggle
  $('.half-height').click(function() {
    $.ajax({
      url:      '/articles/half-size-state',
      data:     { active: true },
      method:   'post',
      dataType: 'json',
      success: function(data) {
        $('.article').addClass('half-height');
      }
    });
  });

  $('.full-height').click(function() {
    $.ajax({
      url:      '/articles/half-size-state',
      data:     { active: false },
      method:   'post',
      dataType: 'json',
      success: function(data) {
        $('.article').removeClass('half-height');
      }
    });
  });

  // http://tinysort.sjeiti.com/
  $('.alpha-sort').click(function() {

  });

  $('.date-sort').click(function() {

  });
});
