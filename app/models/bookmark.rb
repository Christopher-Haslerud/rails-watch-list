class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list


  def create
    @bookmark = Bookmark.new(bookmark_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @movie = Movie.find(params[:movie_id])
    @bookmark.movie = @movie
    @bookmark.save
    redirect_to movie_path(@movie)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
