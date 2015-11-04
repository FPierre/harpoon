this.App.articles = this.App.cable.subscriptions.create('ArticlesChannel', {
  received: function(article) {
    console.log(article);

    // Materialize.toast("<span>Nouvel Article</span><a href='#" + article.title + "' class='btn-flat yellow-text'>Voir<a>", 3000, 'rounded');
    return $('#articles').prepend(this.renderMessage(article)).fadeIn();
  },
  renderMessage: function(article) {
    // return "<article id='" + article.title + "' class='article'> <a href='" + article.url + "'> <div class='row'> <div class='col s10'> <h5>" + article.title + "</h5> <p>" + article.created_at + "</p> </div> <div class='col s2'> <p class='right-align'>" + article.website + "</p> </div> </div> </a> </article>";

    return '<article class="article" data-public-id="' + article.public_id + '">' +
             '<div class="hyper list-group-item">' +
               '<div class="row">' +
                 '<div class="col-xs-11">' +
                   '<a href="' + article.url + '">' +
                     '<div class="row">' +
                       '<div class="col-sm-1 hidden-xs-down">' +
                         '<span class="label label-default label-pill">1</span>' +
                       '</div>' +

                       '<div class="col-xs-12 col-sm-11">' +
                         '<h4 class="list-group-item-heading">' + article.title + '</h4>' +
                       '</div>' +
                     '</div>' +
                   '</a>' +
                 '</div>' +

                 '<div class="col-xs-1 text-right">' +
                 '</div>' +
               '</div>' +
             '</div>' +
           '</article>';
  }
});
