class WatchlistsController < ApplicationController
  def create
    @movie = Movie.find_by(id: params[:movie_id])
    if current_user
      @watchlist = Watchlist.new
      @watchlist.movie = @movie
      @watchlist.user = current_user
      @watchlist.save
      redirect_to :back
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @watchlist = Watchlist.find_by(id: params[:id])
    @watchlist.destroy
    redirect_to :back
  end
end
