class BooksController < ApplicationController
  

  def index
    @book = Book.new
    @books
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
  end
  
  # 投稿データのストロングパラメータ
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
