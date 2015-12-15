class ChaptersController < ApplicationController

  def create
    @book = Book.find params[:book_id]
    @chapter = Chapter.create chapter_params
    redirect_to edit_book_chapter_path(params[:book_id], @chapter.id)
  end

  def edit
    @book = Book.find params[:book_id]
    @chapter = Chapter.find params[:id]
  end 

  def update
    @chapter = Chapter.find params[:id]
    @chapter.update chapter_params
    redirect_to book_path(params[:book_id])
  end


  private
  def chapter_params
    params.permit(:name, :book_id, :chapter_ids => [] )
  end
end
