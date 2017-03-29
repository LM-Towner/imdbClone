class MoviesController < ApplicationController
  def index
  end

  def show
    @commentable = Movie.find_by(id: params[:id])
    @movie = Movie.preload(:reviews, :comments, :reviewing_users, :commenting_users).find_by(id: params[:id])
  end
end
