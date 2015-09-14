jQuery(document).ready(function($) {
  $('.button-collapse[data-activates=main-sidebar]').sideNav();
  $('.button-collapse[data-activates=account-sidebar]').sideNav({ edge: 'right' });

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
    $('#article-actions-modal .modal-footer .delete').attr('href', '/articles/' + $(this).data('id'));
    $('#article-actions-modal .modal-footer .keep').attr('href', '/articles/' + $(this).data('id'));
    $('#article-actions-modal .modal-footer .read-later').attr('href', '/articles/' + $(this).data('id'));

    $('#article-actions-modal').openModal();
  });

  $('.article').on('flick', function(e) {
    e.preventDefault();
    // console.log(this, e);
  });

  $('#article-actions-modal .delete').click(function() {
    $.ajax({
      url:      $(this).attr('href'),
      method:   'delete',
      success: function(data) {
      }
    });
  });

  $('#article-actions-modal .keep').click(function() {
    $.ajax({
      url:      $(this).attr('href'),
      data:     { action: 'keep' },
      method:   'post',
      dataType: 'json',
      success: function(data) {
      }
    });
  });

  $('#article-actions-modal .read-later').click(function() {
    $.ajax({
      url:      $(this).attr('href'),
      data:     { action: 'read_later' },
      method:   'post',
      dataType: 'json',
      success: function(data) {
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

  $('.up').click(function() {
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    return false;
  });
});
