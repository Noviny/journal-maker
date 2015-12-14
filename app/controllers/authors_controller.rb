class AuthorsController < ApplicationController
  before_action :check_if_logged_in

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    @author.save
    redirect_to author_path(@author.id)
  end

  def show
    @author = Author.find params[:id]
  end

  def edit
    @author = Author.find params[:id]
  end

  def update
    @author = Author.find params[:id]
    @author.update author_params
    redirect_to author_path(@author.id)
  end

  private
  def author_params
    params.require(:author).permit(:name, :job)
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end
end
