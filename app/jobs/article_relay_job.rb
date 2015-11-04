class ArticleRelayJob < ApplicationJob
  def perform article
    ActionCable.server.broadcast 'articles', { article: article }
    # article: ArticlesController.render(partial: 'articles/article', locals: { article: article })
  end
end
