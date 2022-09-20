class BooksController < ApplicationController
  def new
    @newbook = Book.new
  end
  
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
    @user = current_user
    @newbook = Book.new
    @book = Book.find(params[:id])
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
  
end
