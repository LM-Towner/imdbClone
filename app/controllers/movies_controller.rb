class MoviesController < ApplicationController
  def index
    @movies = Movie.all

  end



  def search
    if params[:search] == ""
      redirect_to :back
    else
      # come back to this later
      params[:search] = params[:search].split(" ").map { |word| word.capitalize }.join(" ")
      movie = Movie.database_query(params[:search])
      if movie == "Movie not found!"
        flash[:alert] = "Movie not found!"
        redirect_to :back
      else
        redirect_to movie_path(movie)
      end
    end
  end

  def show
    @movie = Movie.preload(:reviews, :comments, :reviewing_users, :commenting_users).find_by(id: params[:id])
  end

end
