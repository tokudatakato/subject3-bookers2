class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def update
    @user = User.find(params[:id])
    @book = Book.new
    if @user.update(user_params)
      redirect_to user_path(params[:id])
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user_id = params[:id]
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end
end
