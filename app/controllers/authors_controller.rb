class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
