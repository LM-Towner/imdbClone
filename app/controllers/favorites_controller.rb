class FavoritesController < ApplicationController
  def create
    @movie = Movie.find_by(id: params[:movie_id])
    if current_user
      @favorite = Favorite.new
      @favorite.movie = @movie
      @favorite.user = current_user
      @favorite.save
      redirect_to :back
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    redirect_to :back
  end
end
