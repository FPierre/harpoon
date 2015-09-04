class StatisticsController < ApplicationController
  def index
    @percent_categories          = Article.percent_categories
    @percent_categories_days     = Article.percent_categories_days
    @percent_categories_websites = Article.percent_categories_websites
  end
end
