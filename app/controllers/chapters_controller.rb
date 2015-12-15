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
    @chapter = Chapter.find params[:id]
    @chapter.update edit_chapter_params
    book = Book.find params[:book_id]
    articles = params[:chapter][:article_ids]
    raise 'tears'
    if articles.is_a? Array
      articles.each do |a|
        if book.articles.include?( a )
          book.articles.delete(a)
        end
      end
    end
    redirect_to book_path(params[:book_id])
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
