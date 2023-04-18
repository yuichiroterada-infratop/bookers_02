class BooksController < ApplicationController
  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      render books_path
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(books_params)
      redirect_to books_path(book.id)
    else
      @books = Book.all
      @book = Book.new
      render books_path
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end
