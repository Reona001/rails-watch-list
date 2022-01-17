class BookmarksController < ApplicationController
    # def index
    # @movie = Movie.find(params[:id]

  # def show
  #   @bookmarks = Bookmark.all
  # end

  def new
    @movies = Movie.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

# {"authenticity_token"=>"[FILTERED]", "bookmark"=>{"movie_id"=>"2", "comment"=>"nice"}, "commit"=>"Create Bookmark", "list_id"=>"3"}


  private

  def bookmark_params
    params.require(:bookmark).permit(:movie, :comment)
  end
end
