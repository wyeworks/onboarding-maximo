class UserMoviesController < ApplicationController

  def index
    user_movie = UserMovie.all
    render json: user_movie
  end

  def show
    user_movie = UserMovie.find(params[:id])
    render json: user_movie
  end

  def create
    # data = request
    # movie = Movie.new(title: data[:title], genre: data[:genre], score: data[:score], cast_id: data[:cast_id], 
    #    director_id: data[:director_id], source_id: data[:source_id], release_date: data['release_date'])
    user_movie = UserMovie.new(user_movie_params)

    if user_movie.save
      render json: '{"message":"Successfully created user_movie"}'
    else
      render json: "{'message':'Successfully created user_movie', 'errors': #{user_movie.errors.as_json}}"
    end
  end

  def destroy
    user_movie = UserMovie.find(params[:id])
    user_movie.destroy
    redirect_to user_movie_path, status: :see_other, notice: "The user_movie was removed succesfully"
  end

  def update
    user_movie = Movie.find(params[:id])
    if user_movie.update(user_movie_params)
      redirect_to user_movie_path(user_movie)
    else
      render json: { error: "Failed to update user_movie" }, status: :unprocessable_entity
    end
  end  

  private

  def user_movie_params
    params.permit(:cast_id, :movie_id)
  end  
end