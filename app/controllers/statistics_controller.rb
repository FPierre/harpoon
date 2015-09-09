class StatisticsController < ApplicationController
  before_action :set_categories
  before_action :set_websites

  def index
    @percent_categories       = Article.percent_categories
    @percent_categories_days  = Article.percent_categories_days
    @percent_categories_hours = Article.percent_categories_hours
  end

  private

  def set_categories
    config = Rails.application.config_for(:crawler)
    @categories = config['categories'].keys
  end

  def set_websites
    config = Rails.application.config_for(:crawler)
    @websites = config['websites'].keys
  end
end
