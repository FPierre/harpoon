class ArticlesController < ApplicationController
  before_action :set_article,    only: :destroy
  before_action :set_websites,   only: :index
  before_action :set_categories, only: :index

  def index
    @articles = Article.paginate(page: params[:page], per_page: 30).order(created_at: :desc)
    @size = cookies[:size]
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.js
    end
  end

  def bookmark_selected
    Article.where(public_id: params[:articles_publics_ids]).update_all bookmarked: true

    head :ok
  end

  def destroy_selected
    Article.delete_all public_id: params[:articles_publics_ids]

    head :ok
  end

  def sort
    sort = params[:sort].presence || :time

    respond_to do |format|
      format.json { Article.all }
    end
  end

  def half_size_state
    cookies[:size] = params[:active] if params[:active]

    respond_to do |format|
      format.js
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
