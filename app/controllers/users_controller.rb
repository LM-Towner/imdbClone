class UsersController < ApplicationController
   before_action :authenticate_user!
  def show
    if current_user
    @user = User.find_by(id: params[:id])
  else
    redirect_to new_user_session_path
    end
  end
end
