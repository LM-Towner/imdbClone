class CommentsController < ApplicationController
  def create
    if current_user
      @commentable = find_commentable
      @comment = @commentable.comments.build(comment_params)
      @comment.user = current_user
      @comment.save
      track_activity @comment
      #error handling?
      redirect_to :back
    else
      redirect_to new_user_session_path
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
