class MoviesController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def create
    # data = request
    # movie = Movie.new(title: data[:title], genre: data[:genre], score: data[:score], cast_id: data[:cast_id], 
    #    director_id: data[:director_id], source_id: data[:source_id], release_date: data['release_date'])
    movie = Movie.new(movie_params)

    if movie.save
      render json: '{"message":"Successfully created movie"}'
    else
      render json: "{'message':'Successfully created movie', 'errors': #{movie.errors.as_json}}"
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path, status: :see_other, notice: "The movie was removed succesfully"
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      redirect_to movie_path(movie)
    else
      render json: { error: "Failed to update movie" }, status: :unprocessable_entity
    end
  end

  def cast
    movie = Movie.find(params[:id])
    render json: movie.actors
  end

  def director
    movie = Movie.find(params[:id])
    render json: movie.director
  end

  def source
    movie = Movie.find(params[:id])
    render json: movie.source
  end

  private

  def movie_params
    params.permit(:title, :genre, :score, :director_id, :cast_id, :source_id, :release_date)
  end
end
