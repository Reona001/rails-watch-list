class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @lists = List.all
    @list = List.find(params[:id])
    # @movie = Movie.find(params[:id])
  end

  def new
    @list = List.create
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    # it works what is :format?
    @list = List.find(params[:format])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :comment, :photo)
  end
end
