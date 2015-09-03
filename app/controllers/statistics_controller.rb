class StatisticsController < ApplicationController
  def index
    @percent_categories = Article.percent_categories
  end
end
