class MoviesController < ApplicationController
  before_action :get_movie, only: [:show, :destroy, :update]

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    render json: @movie
  end

  def create
    # data = request
    # movie = Movie.new(title: data[:title], genre: data[:genre], score: data[:score], cast_id: data[:cast_id], 
    #    director_id: data[:director_id], source_id: data[:source_id], release_date: data['release_date'])
    movie = Movie.new(movie_params)

    if movie.save
      render json: movie
    else
      render json: { message: "Error while creating movie", errors: movie.errors.as_json }
    end
  end

  def destroy
    if @movie.destroy
      render json: { message: "The movie ##{params[:id]} was removed successfully" }
    else
      render json: { message: "The movie ##{params[:id]} couldn't be removed", errors: @movie.errors.as_json }
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: { error: "Failed to update movie" }, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.permit(:title, :genre, :score, :director_id, :cast_id, :source_id, :release_date)
  end

  def get_movie
    @movie = Movie.find(params[:id])
  end
end