jQuery(document).ready(function($) {
  $('.button-collapse').sideNav();

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

  // TODO Swipe à gauche ou à droite pour delete un article

  $('.article').on('press', function(e) {
    // e.preventDefault();
    // console.log(this, e);
    $('#article-actions-modal .modal-content h4').text($('.title h3', this).text());
    $('#article-actions-modal .modal-content p').text($('.title p', this).text());
    $('#article-actions-modal .modal-footer .delete').attr('href', '/article/' + $(this).data('id'));
    $('#article-actions-modal .modal-footer .keep').attr('href', '/article/' + $(this).data('id'));
    $('#article-actions-modal .modal-footer .read-later').attr('href', '/article/' + $(this).data('id'));

    $('#article-actions-modal').openModal();
  });

  $('.article').on('flick', function(e) {
    e.preventDefault();
    // console.log(this, e);
  });

  $('#article-actions-modal .delete').click(function() {

  });

  $('#article-actions-modal .keep').click(function() {

  });

  $('#article-actions-modal .read-later').click(function() {

  });


  // $('.article .created-at').click(function() {
  //   // TODO Trouver un moyen plus élégant de cherche .article parent
  //   $article = $(this).parent().parent();

  //   if ($article.hasClass('on-update')) {
  //     $article.removeClass('on-update');
  //   }
  //   else {
  //     $('.article.on-update').removeClass('on-update');
  //     $article.addClass('on-update');
  //   }
  // });

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
