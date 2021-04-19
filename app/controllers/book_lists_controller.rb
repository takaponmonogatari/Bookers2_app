class BookListsController < ApplicationController



  def create
    @book_list = BookList.new(book_list_params)
    @book_list.user_id = current_user.id
    @book_list.save
    redirect_to book_lists_path
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
    @user = @book_list.user
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

  def book_list_params
   params.require(:book_list).permit(:title, :body, :user_id)
  end

end
