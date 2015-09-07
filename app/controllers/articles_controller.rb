class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
    config = Rails.application.config_for(:crawler)
    @categories = config['categories'].keys

    @half_size = cookies[:half_size]
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    head :no_content
  end

  def half_size_state
    cookies[:half_size] = params[:active] if params[:active]

    respond_to do |format|
      format.json { render status: :ok }
    end
  end
end
