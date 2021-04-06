class SearchesController < ApplicationController
  def index
    @shows = Show.search_by_title(params[:search])
    render 'shows/index'
  end
end
