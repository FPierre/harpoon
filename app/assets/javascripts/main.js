jQuery(document).ready(function($) {
  $('.button-collapse').sideNav();

  $('.news-container li').hover(function() {

  });

  // TODO Passer à Toggle
  $('.half-height').click(function() {
    $('.article').addClass('half-height');
  });

  $('.full-height').click(function() {
    $('.article').removeClass('half-height'); // .addClass('full-height');
  });

  // http://tinysort.sjeiti.com/
  $('.alpha-sort').click(function() {

  });

  $('.date-sort').click(function() {

  });
});
