class BooksController < ApplicationController
  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "You have created book successfully!"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
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
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = "You have updated book successfully!"
      redirect_to book_path(@book.id)
    else
      render :edit
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
