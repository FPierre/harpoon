class CategoriesController < ApplicationController
  # before_action :set_category, only: []
  # before_action :set_categories

  def index
    @categories = Category.all
  end

  private

  def set_category
    @category = Category.find params[:id]
  end
end
