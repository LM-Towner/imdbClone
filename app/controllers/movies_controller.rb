class MoviesController < ApplicationController
  def index
  end

  def show
    @movie = Movie.preload(:reviews, :comments).find_by(id: params[:id])
  end
end
