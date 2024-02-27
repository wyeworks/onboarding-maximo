# UsersController
class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index 
    render json: User.all
  end

  def show
    user_id = params[:id]
    render json: User.find(user_id)  
  end

  def create
    user = User.new(user)

    if user.save
      render json: '{"message":"Successfully created User"}'
    else
      render json: "{'message':'Error creating User', 'errors': #{user.errors.as_json}}"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user)
    else
      render json: { error: "Failed to update user" }, status: :unprocessable_entity
    end
  end
  
  private
  def user_params
    params.permit(:name, :type_ci, :ci, :birth_date)
  end
end