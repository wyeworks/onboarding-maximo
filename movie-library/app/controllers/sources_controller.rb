class SourcesController < ApplicationController
    # skip_before_action :verify_authenticity_token
    def index 
      render json: Source.all
    end
    def show
      user_id = params[:id]
      render json: Source.find(user_id)  
    end
    def create
      source = Movie.new(movie_params)
      if source.save
        render json: '{"message":"Successfully created Source"}'
      else
        render json: "{'message':'Error creeating Source', 'errors': #{source.errors.as_json}}"
      end
    end
    def destroy
      source = Source.find(params[:id])
      source.destroy
      redirect_to users_path, status: :see_other, notice: "The Source was removed succesfully"
    end
    def update
      source = Source.find(params[:id])
      if source.update(source_params)
        redirect_to source_path(source)
      else
        render json: { error: "Failed to update source" }, status: :unprocessable_entity
      end
    end
    
    private
    def source_params
      params.permit(:duration, :location, :format)
    end
end

