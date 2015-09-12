class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_categories

  def index

  end

  private

  def set_categories
    config = Rails.application.config_for(:crawler)
    @categories = config['categories'].keys
  end
end
