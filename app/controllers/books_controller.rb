class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
