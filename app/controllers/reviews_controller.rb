class ReviewsController < ApplicationController


  def index
    @reviews = Review.all
  end
  def show
    @review = Review.find(params[:id])
    raise
  end

  def new
    # we need @restaurant in our `simple_form_for`
    
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @movie = Movie.find(params[:movie_id])
    @review.movie = @movie
    @review.save
    
    redirect_to movie_path(@movie)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movie_path(@review.movie)
  end

  private

  def review_params
    params.require(:review).permit(:title, :description)
  end
end
