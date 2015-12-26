class ChaptersController < ApplicationController

  def show
    @book = Book.find params[:book_id]
    @chapter = Chapter.find params[:id]
  end

  def create
    @book = Book.find params[:book_id]
    @chapter = Chapter.create create_chapter_params
    redirect_to edit_book_chapter_path(params[:book_id], @chapter.id)
  end

  def edit
    @book = Book.find params[:book_id]
    @chapter = Chapter.find params[:id]
  end 

  def update
    if params[:article].present?
      @chapter = Chapter.find params[:article][:chapter_ids]
      a = Article.find params[:id]
      @chapter.articles << a
      redirect_to "/books/#{@chapter.book.id}/format"
    else
      @chapter = Chapter.find params[:id]
      @chapter.update edit_chapter_params
      redirect_to book_path(params[:book_id])
    end
  end

  def remove
    chapter = Chapter.find params[:chapter_id]
    chapter.articles.delete params[:articles_id]
    redirect_to "/books/#{params[:book_id]}/format"
  end

  def destroy
    chapter = Chapter.find params[:id]
    chapter.destroy
    redirect_to book_path(params[:book_id])
  end


  private

  def create_chapter_params
    params.permit(:name, :book_id)
  end

  def edit_chapter_params
    params.require(:chapter).permit(:name, :book_id, :article_ids => [] )
  end
end
