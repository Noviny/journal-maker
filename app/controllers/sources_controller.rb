class SourcesController < ApplicationController
  before_action :check_if_logged_in

  def index
    @sources = Source.all
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new source_params
    @source.save
    redirect_to source_path(@source.id)
  end

  def show
    @source = Source.find params[:id]
  end

  def edit
    @source = Source.find params[:id]
  end

  def update
    @source = Source.find params[:id]
    @source.update source_params
    redirect_to source_path(@source.id)
  end

  private
  def source_params
    params.require(:source).permit(:name, :style, :description, :domain)
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end
end
