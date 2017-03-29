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
    @commentable = Movie.find_by(id: params[:id])
    @movie = Movie.preload(:reviews, :comments, :reviewing_users, :commenting_users).find_by(id: params[:id])
  end

end
