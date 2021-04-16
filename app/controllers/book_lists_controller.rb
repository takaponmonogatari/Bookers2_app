class BookListsController < ApplicationController
  def new
    @book_list = BookList.new
  end

  def create
    @book_list = BookList.new(book_list_params)
    @book_list.user_id = current_user.id
    @book_list.save
    redirect_to book_lists_path
  end

  def index
    @book_lists = BookList.all  
  end

  def show
  end

  def destroy
  end


   private

  def book_list_params
    params.require(:book_list).permit(:title, :opinion)
  end

end
