class NewsController < ApplicationController
  def index
    @news = New.all
  end

  def destroy
    @new = New.find(params[:id])

    @new.destroy
    head :no_content
  end
end