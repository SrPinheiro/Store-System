class Api::RoleController < ApplicationController
  before_action :object, only: %i[ show destroy]

  def index
    render json: Role.all, status: :ok
  end

  def show
    render json: @role, status: :ok
  end

  def create
    @role = Purchase.new object_params
    if @role.save
      redirect_to api_role_path(@role)
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  def destroy
    if @role.destroy!
      render json: { message: "Product id: #{@purchase[:id]} removed" }, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  private

  def object
    id = params.require :id
    begin
      @role = Role.find id
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Not Found' }, status: :not_found
    end
  end

  def object_params
    params.require(:role).permit(:name)
  end
end
