class ArticlesController < ApplicationController
  before_action :set_categories

  def index
    @articles  = Article.paginate(page: params[:page], per_page: 20).order(created_at: :desc)
    @half_size = cookies[:half_size]
  end

  def destroy
    @article = Article.find params[:id]

    @article.destroy
    head :no_content
  end

  def half_size_state
    cookies[:half_size] = params[:active] if params[:active]

    respond_to do |format|
      format.json { render status: :ok }
    end
  end

  private

  def set_categories
    config = Rails.application.config_for :crawler
    @categories = config['categories'].keys
  end
end
