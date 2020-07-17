class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash[:error] = "error Failed to create a book"
      @books = Book.all
      @book = book
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
       @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "successfully updated book!"
       redirect_to book_path(@book.id)
    else
      flash[:error] = "error: Failed to create a book."
      render :edit
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
