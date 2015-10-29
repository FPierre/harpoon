class ArticlesController < ApplicationController
  before_action :set_article,    only: :destroy
  before_action :set_categories, only: :index
  before_action :set_websites,   only: :index

  def index
    @articles  = Article.paginate(page: params[:page], per_page: 40).order(created_at: :desc)
    @half_size = cookies[:half_size]
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully deleted' }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  def destroy_all
    Article.delete_all public_id: params[:articles_ids]

    render json: :ok
  end

  def sort
    sort = params[:sort].presence || :time
    render json { Article.all }
  end

  def half_size_state
    cookies[:half_size] = params[:active] if params[:active]

    respond_to do |format|
      format.json { render status: :ok }
    end
  end

  private

  def set_article
    @article = Article.find params[:id]
  end

  def set_categories
    @categories = Category.all
  end

  def set_websites
    @websites = Website.all
  end
end
