App.articles = App.cable.subscriptions.create 'ArticlesChannel',
  received: (article) ->
    Materialize.toast("<span>Nouvel Article</span><a href='##{article.title}' class='btn-flat yellow-text'>Voir<a>", 3000, 'rounded')
    $('#articles').prepend @renderMessage(article)

  renderMessage: (article) ->
    "<article id='#{article.title}' class='article'>
      <a href='#{article.url}'>
        <div class='row'>
          <div class='col s10'>
            <h5>#{article.title}</h5>
            <p>#{article.created_at}</p>
          </div>

          <div class='col s2'>
            <p class='right-align'>#{article.website}</p>
          </div>
        </div>
      </a>
    </article>"
