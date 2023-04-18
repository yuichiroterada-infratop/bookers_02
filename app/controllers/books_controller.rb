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
    @book = Book.new(books_params)
  end

  def show
    
  end
  
  def edit
    
  end
  
  def destroy
    
  end
  
  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end
