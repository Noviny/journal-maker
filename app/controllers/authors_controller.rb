class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
  end

  def show
    @author = Author.find params[:id]
  end

  def edit
  end
end
