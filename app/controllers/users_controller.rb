class UsersController < ApplicationController
  def show
    @user = User.find(user_params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(user_params[:id])
  end
  
  def update
    @user = User.find(user_params[:id])
    @user.update(user_params)
    redirect_to user_path(user_params[:id])
  end

  def index
    @users = User.all
    @user = User.find(user_params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
