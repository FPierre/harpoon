$(document).on('ready page:load', function() {
  $('#chk-all-articles').change(function() {
    $('.article input[type=checkbox]').prop('checked', function(i, value) {
      return !value;
    });
  });

  // TODO Swipe à gauche ou à droite pour delete un article

  // Delegated event for Websocket
//  $('#articles').on('flick', '.article', function(e) {
//    // console.log(this, e);
//
//    if (e.orientation == 'horizontal' && e.dx > 10) {
//      console.log('triggered');
//
//      $(this).
//    }
//  });


// delegated event
// $('#articles').on('tap', '.article', function(e) {
//     // console.log('tap');
// });

// $('#link-id').unbind('click');

$('a').click(function(e) {
  e.preventDefault();
});

// delegated event
// $('#articles').on('press', '.article', function(e) {
//   // $('a').attr("disabled","disabled");
//     console.log('press');
// });

  // Delegated event for Websocket
  $('#articles').on('drag', '.article', function(e) {
    // console.log(this, e);

    var dragLimit = 130;

console.log(e.end);

    if (e.dx < 0 && e.dx >= -dragLimit) {
      $(this).css({
        'margin-right': -e.dx,
        'margin-left': e.dx,
      });
    }

    // while (e.dx > ) {
      // if (e.orientation == 'horizontal') {
      //   $(this).animate({
      //     left: "+=dx",
      //   }, 5000, function() {

      //   });
      // }
    // }
  });


  $('.article').on('press', function(e) {
    // e.preventDefault();
    // console.log(this, e);
    // $('#article-actions-modal .modal-content h4').text($('.title h3', this).text());
    // $('#article-actions-modal .modal-content p').text($('.title p', this).text());
    // $('#article-actions-modal .modal-footer .delete').attr('href', '/articles/' + $(this).data('id'));
    // $('#article-actions-modal .modal-footer .keep').attr('href', '/articles/' + $(this).data('id'));
    // $('#article-actions-modal .modal-footer .read-later').attr('href', '/articles/' + $(this).data('id'));

    // $('#article-actions-modal').openModal();
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
