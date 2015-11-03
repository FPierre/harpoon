$(document).on('ready page:load', function() {
  $('.btn-delete').click(function() {
    var articlesPublicsIds = [];
        $selectedArticles  = $('.article.selected');

    $selectedArticles.each(function(index) {
      articlesPublicsIds.push($(this).data('public-id'));
    });

    $.ajax({
      url: '/articles/delete',
      method: 'DELETE',
      data: { 'articles_publics_ids': articlesPublicsIds },
      context: $selectedArticles,
      success: function(data, textStatus, jqXHR) {
        $selectedArticles.fadeOut('slow', function() {
          $(this).remove();
        });
      }
      // error: function(jqXHR, textStatus, errorThrown) {
      //   console.log('error');
      // }
    });
  });




  var selectedArticles = 0;

  // $('#chk-all-articles').change(function() {
  //   $('.article input[type=checkbox]').prop('checked', function(i, value) {
  //     return !value;
  //   });
  // });

  $('a').click(function(e) {
    e.preventDefault();
  });

  // // delegated event
  // $('#articles').on('tap', '.article', function(e) {
  //   console.log(this, e);
  // });

  // Delegated event for Websocket
  $('#articles').on('drag', '.article', function(e) {
    // console.log(this, e);

    var dragLimit = 100;

    // To right
    // if (e.dx >= 0 && e.dx <= dragLimit) {
    //   $('.hyper', this).css({
    //     'margin-right': -e.dx,
    //     'margin-left': e.dx
    //   });
    // }

    // if (e.end && e.dx <= dragLimit) {
    //   $('.hyper', this).animate({
    //     'margin-right': '0',
    //     'margin-left': '0'
    //   }, 450);
    // }

    // To left

    if (e.dx < 0 && e.dx >= -dragLimit) {
      $('.hyper', this).css({
        'margin-right': -e.dx,
        'margin-left': e.dx
      });
    }

    if (e.end && e.dx <= dragLimit) {
      $('.hyper', this).animate({
        'margin-right': '0',
        'margin-left': '0'
      }, 450);
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

  $('#articles').on('press', '.article', function(e) {
    // e.preventDefault();
    // console.log(this, e);

    if ($(this).hasClass('selected')) {
      $(this).removeClass('selected');
      selectedArticles--;
    }
    else {
      $(this).addClass('selected');
      selectedArticles++;
    }

    if (selectedArticles > 0) {
      $('#actions-bar').fadeIn();
    }
    else {
      $('#actions-bar').fadeOut();
    }
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
