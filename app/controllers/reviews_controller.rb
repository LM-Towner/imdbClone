class ReviewsController < ApplicationController
  def create
    if current_user
      @movie = Movie.find_by(id: params[:movie_id])
      @review = @movie.reviews.build(review_params)
      @review.user = current_user
      @review.save
      # current_user.activities.create! action: "create", trackable: review
      track_activity @review
      #error handling?
      redirect_to :back
    else
      redirect_to new_user_session_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :text)
  end
end
