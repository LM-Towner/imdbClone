class MoviesController < ApplicationController
  def index
    @movies = Movie.all

  end



  def search
    if params[:search] == ""
      redirect_to :back
    elsif Movie.database_query(params[:search]) == "Movie not found!"
      flash[:alert] = "Movie not found!"
      redirect_to :back
    else
      @movie = Movie.database_query(params[:search])
      @commentable = Movie.find(@movie.id)
      render "movies/show"
    end
  end

  def show
    @commentable = Movie.find_by(id: params[:id])
    @movie = Movie.preload(:reviews, :comments, :reviewing_users, :commenting_users).find_by(id: params[:id])
  end

end
