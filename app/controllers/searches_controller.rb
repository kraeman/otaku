class SearchesController < ApplicationController
  def index
    shows = Show.search_by_title(params[:search])
    characters = Character.search_by_name(params[:search])
    actors = Actor.search_by_name(params[:search])
    @results = shows + characters + actors 
    render 'searches/index'
  end
end
