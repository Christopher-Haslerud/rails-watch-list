class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def show
    @movie = Movie.find(params[:id])
  end
  def new
    @movie = Movie.new
  end
  def create
    @movie = Movie.new(movie_params)
    @movie.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
