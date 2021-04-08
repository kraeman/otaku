class SearchesController < ApplicationController
  def results
    shows = Show.search_by_title(params[:search])
    characters = Character.search_by_name(params[:search])
    actors = Actor.search_by_name(params[:search])
    @results = shows + characters + actors 
    render 'searches/results'
  end
end
