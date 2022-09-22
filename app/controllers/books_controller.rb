class BooksController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}
  
  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
      redirect_to book_path(@newbook.id), notice: "Book was successfully created."
    else
      @user = current_user
      @books = Book.all
      render "books/index"
    end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    
    @comments = BookComment.all
    @book_comment = BookComment.new
  end

  def index
    @user = current_user
    @newbook = Book.new
    @books = Book.all
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render "edit"
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def ensure_current_user
    user = Book.find(params[:id]).user
    if current_user.id != user.id
      redirect_to books_path
    end
  end
  
end
