class MoviesController < ApplicationController
  def index
    @movies = Movie.all

  end



  def search
    if Movie.search(params[:search])
      @movies = Movie.search(params[:search])
    else
      notice "No movie with that information"
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
