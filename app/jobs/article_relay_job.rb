class ArticleRelayJob < ApplicationJob
  def perform(article)
    ActionCable.server.broadcast 'articles', { title: 'test' }
      # article: ArticlesController.render(partial: 'articles/article', locals: { article: article })
  end
end
