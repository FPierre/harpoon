class NewsController < ApplicationController
  def index
    @news = New.all

    config = Rails.application.config_for(:crawler)
    @categories = config['tags']
  end

  def destroy
    @new = New.find(params[:id])

    @new.destroy
    head :no_content
  end
end
