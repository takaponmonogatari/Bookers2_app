class UsersController < ApplicationController
  before_action :ensure_user, only: [:edit, :update]
  def index
    @users = User.all
    @user = current_user
    @book_list = BookList.new
  end

  def show
    @user = User.find(params[:id])
    @book_lists = @user.book_lists
    @book_list = BookList.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
    else
    render :edit
    flash[:alert]
    end
  end



   private
  def ensure_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

