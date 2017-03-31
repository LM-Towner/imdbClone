class ReviewsController < ApplicationController
  def create
    if current_user
      @movie = Movie.find_by(id: params[:movie_id])
      @review = @movie.reviews.build(review_params)
      @review.user = current_user
      # current_user.activities.create! action: "create", trackable: review
      track_activity @review
      respond_to do |format|
        if @review.save
          format.js {}
          format.html { redirect_to :back }
        else
          format.js { redirect_to :back }
          format.html {redirect_to :back}
        end
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy if @review.user == current_user
    respond_to do |format|
      format.js {}
      format.html { redirect_to :back }
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
    if @review && @review.user == current_user
      render 'edit'
    else
      redirect_to :back
    end
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review && @review.user == current_user
      @review.update_attributes(review_params)
      @review.save
      redirect_to movie_path(@review.movie)
    else
      redirect_to :back
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :text)
  end
end
