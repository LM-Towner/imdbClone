class MoviesController < ApplicationController
  def index
    @movies = Movie.all

  end



  def search
    if Movie.database_query(params[:search])
      @movie = Movie.database_query(params[:search])
      @commentable = Movie.find(@movie.id)
      render "movies/show"
    else
      notice "No movie with that information"
    end
  end

  def show
    @movie = Movie.preload(:reviews, :comments, :reviewing_users, :commenting_users).find_by(id: params[:id])
  end

end
