class ArticlesController < ApplicationController
  before_action :check_if_logged_in, :except => [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new article_params
    if article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def supercreate
    @article = Article.new
  end

  def supercreating
    @url = params[:article][:url]
    page = Nokogiri::HTML(open(@url))
    @heading = page.css('h1')[0].text
    @article = Article.new article_params
    redirect_to new_article_path
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    @article.update article_params
    redirect_to articles_path
  end

  def show
    @article = Article.find params[:id]
  end

  def destroy
    article = Article.find params[:id]
    article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:heading, :url, :description, :image, :excerpt, :date)
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end

  def check_if_admin
    redirect_to articles_path unless ( @current_user.present? && @current_user.admin? )
  end
end
