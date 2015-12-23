class BooksController < ApplicationController
  before_action :check_if_logged_in, :except => [:index, :show, :new]
  before_action :check_if_mine_or_admin, :only => [:destroy, :update]

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
    book.user_id = @current_user.id
    book.save
    if params[:book][:articles].present?
      article = Article.new article_params
      article.save
      book.articles << article
    end
    book.update book_params
    redirect_to articles_supercreate_path
  end

  def articles
    @book = Book.find params[:id]
    @article = Article.new
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
    if params[:book][:articles].present?
      article = Article.new article_params
      article.save
      book.articles << article
    end
    book.update book_params
    
    # book.update :article_ids => @article.id
    redirect_to book_path
  end

  def format
    @book = Book.find params[:id]
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
    params.require(:book).permit(:name, :subheading, :description, :article_ids => [])
  end

  def article_params
    params[:book][:articles].permit(:heading, :url, :description, :image, :excerpt, :date)
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end

  def check_if_mine_or_admin
    book = Book.find params[:id] 
    redirect_to root_path unless ( @current_user.present? && ( ( book.user === @current_user ) || @current_user.admin? ) )
  end
end
