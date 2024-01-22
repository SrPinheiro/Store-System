class Api::ProductController < ApplicationController
  before_action :object, only: %i[update show destroy]

  def index
    render json: Product.all, status: :ok
  end

  def show
    render json: @product, status: :ok
  end

  def create
    @product = Product.new object_params
    if @product.save
      redirect_to api_product_path(@product)
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  def update
    if @product.update object_params
      redirect_to api_product_path(@product)
    else
      render json: { message: 'Something went wrong' }, status: 500
    end
  end

  def destroy
    if @product.destroy
      render json: { message: "Product id: #{@product[:id]} removed" }, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  private

  def object
    id = params.require :id
    begin
      @product = Product.find id
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Not Found' }, status: :not_found
    end
  end

  def object_params
    params.require(:product).permit(:name, :price, :description, :amount, :productCategory_id)
  end
end
