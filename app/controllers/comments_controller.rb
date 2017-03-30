class CommentsController < ApplicationController
  def create
    if current_user
      @commentable = find_commentable
      @comment = @commentable.comments.build(comment_params)
      @comment.user = current_user
      @comment.save
      #error handling?
      redirect_to :back
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy if @comment.user == current_user
    redirect_to :back
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    if @comment && @comment.user == current_user
      render 'edit'
    else
      redirect_to :back
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment && @comment.user == current_user
      @comment.update_attributes(comment_params)
      @comment.save
      redirect_to movie_path(Movie.find_by(id: @comment.find_closest_movie_id))
    else
      redirect_to :back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        binding.pry
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
