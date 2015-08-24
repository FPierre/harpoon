class ArticlesController < ApplicationController
  def index
    # ActionCable.server.broadcast 'articles',
    #   article: Article.all.first

    @articles = Article.all.order(created_at: :desc)
    config = Rails.application.config_for(:crawler)
    @categories = config['tags'].keys
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    head :no_content
  end
end
