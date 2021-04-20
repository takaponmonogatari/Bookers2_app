class BookListsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update]


  def create
    @book_list = BookList.new(book_list_params)
    @book_list.user_id = current_user.id
    if @book_list.save
      redirect_to book_list_path(@book_list.id)
      flash[:notice] = "You have created book successfully."
    else
      render :new
      flash[:alert]
    end
  end

  def index
    @book_list = BookList.new
    @book_lists = BookList.all
    # @book_list = BookList.find(params[:id])
    @user = current_user
  end

  def show
    @book_lists = BookList.all
    @book_list = BookList.find(params[:id])
    @book_listlist = BookList.new
    @user = User.find(params[:id])
  end

  def edit
    @book_list = BookList.find(params[:id])
  end

  def update
    book_list = BookList.find(params[:id])
    book_list.update(book_list_params)
    redirect_to book_lists_path
  end



  def destroy
    book_list = BookList.find(params[:id])
    book_list.destroy
    redirect_to book_lists_path
  end


  private
  def ensure_user
   @user = User.find(params[:id])
   redirect_to user_path(current_user) unless @user == current_user
  end

  def book_list_params
   params.require(:book_list).permit(:title, :body, :user_id)
  end

end
