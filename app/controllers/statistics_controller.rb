class StatisticsController < ApplicationController
  before_action :set_categories

  def index
    @percent_categories          = Article.percent_categories
    @percent_categories_days     = Article.percent_categories_days
    @percent_categories_websites = Article.percent_categories_websites
  end

  private

  def set_categories
    config = Rails.application.config_for(:crawler)
    @categories = config['categories'].keys
  end
end
