# UsersController
class UsersController < ApplicationController
  before_action :get_user, only: [:show, :destroy, :update]

  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user)

    if user.save
      render json: '{"message":"Successfully created User"}'
    else
      render json: { message: "Error creating User", errors: user.errors.as_json }
    end
  end

  def destroy
    if @user.destroy
      render json: { message: "The user ##{params[:id]} was removed successfully" }
    else
      render json: { message: "The user ##{params[:id]} couldn't be removed", errors: @user.errors.as_json }
    end
  end

  def update
    # user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: { error: "Failed to update user" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :type_ci, :ci, :birth_date)
  end

  def get_user
    @user = User.find(params[:id])
  end
end