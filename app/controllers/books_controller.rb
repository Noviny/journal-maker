class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @article = Article.new
  end

  def create
    book = Book.new book_params
    book.save
    redirect_to books_path
  end

  def edit
    @book = Book.find params[:id]
    @articles = Article.all
  end

    def update
    book = Book.find params[:id]
    book.update book_params
    redirect_to book_path
  end

  def show
    @book = Book.find params[:id]
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:name, :article_ids => [])
  end
end
