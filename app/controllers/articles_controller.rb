class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
    config = Rails.application.config_for(:crawler)
    @categories = config['categories'].keys
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    head :no_content
  end
end
