class BooksController < ApplicationController
  before_action :check_if_logged_in, :except => [:index, :show, :new]

  def index
    @books = Book.all
  end

  def new
    unless @current_user.present?
      redirect_to new_user_path
    end
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
    unless @current_user.present? && (@book.user === @current_user)
      redirect_to book_path(@book.id)
    else
    @articles = Article.all
    end
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

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end
end
