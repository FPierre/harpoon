class StatisticsController < ApplicationController
  def index


    config = Rails.application.config_for(:crawler)
    @articles = Article.all.order(created_at: :desc)
    @categories = config['categories'].keys
  end
end
