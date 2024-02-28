class SourcesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :get_source, only: [:show, :destroy, :update]

  def index
    render json: Source.all
  end

  def show
    render json: @source
  end

  def create
    source = Movie.new(movie_params)
    if source.save
      render json: '{"message":"Successfully created Source"}'
    else
      render json: {message:"Error creeating Source", errors: source.errors.as_json}
    end
  end

  def destroy
    if @source.destroy
      render json: { message: "The source ##{params[:id]} was removed successfully" }
    else
      render json: { message: "The source ##{params[:id]} couldn't be removed", errors: @source.errors.as_json }
    end
  end

  def update
    if @source.update(source_params)
      render json: @source
    else
      render json: { error: "Failed to update source" }, status: :unprocessable_entity
    end
  end

  private

  def source_params
    params.permit(:duration, :location, :format)
  end

  def get_source
    @source = Source.find(params[:id])
  end
end