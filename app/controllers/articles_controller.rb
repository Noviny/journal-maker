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

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    @article.update article_params
    redirect_to articles_path
  end

  def supercreate
    @article = Article.new
  end

  def supercreating
    require 'open-uri'
    blockurls = params[:article][:url]
    allurls = blockurls.split(", ")
    book = Book.find params[:article][:book_ids].first
    allurls.each do |pageurl|
      begin
        page = Nokogiri::HTML(open(pageurl))
      rescue
        next
      end
      if pageurl.match('magic.wizards')
        pageheading = page.css('h1')[0].text
        pagedate = Date.parse((pageurl)[-10..-1])
        pageexcerpt = page.css('div#content-detail-page-of-an-article p')[0].text
        article = Article.new(:url => pageurl, :heading => pageheading, :excerpt => pageexcerpt, :date => pagedate)
      elsif pageurl.match('theguardian.com')
        pageheading = page.css("meta[property='og:title']")[0].attributes["content"].value
        article = Article.new(:url => pageurl, :heading => pageheading)
      else
        pageheading = page.css('title').text
        pagesource = pageurl.match(/(https?:\/\/)?(www.)?(\w+.\w+(.?\w+))?/)[3]
        source = Source.find_or_create_by! :name => pagesource
        article = Article.new(:url => pageurl, :heading => pageheading)
      end
      article.save
      source.articles << article if pagesource
      book.articles << article
    end
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
    params.require(:article).permit(:heading, :url, :description, :image, :excerpt, :date, :author_id, :source_id, :book_ids => [], :chapter_ids => "" )
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end

  def check_if_admin
    redirect_to articles_path unless ( @current_user.present? && @current_user.admin? )
  end
end
