class Api::PurchaseController < ApplicationController
  before_action :object, only: %i[update show destroy]

  def index
    render json: Purchase.all, status: :ok
  end

  def show
    render json: @purchase, status: :ok
  end

  def create
    @purchase = Purchase.new object_params
    if @purchase.save
      redirect_to api_purchase_path(@purchase)
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  def update
    if @purchase.update object_params
      redirect_to api_purchase_path(@purchase)
    else
      render json: { message: 'Something went wrong' }, status: 500
    end
  end

  def destroy
    if @purchase.destroy!
      render json: { message: "Product id: #{@purchase[:id]} removed" }, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :internal_server_error
    end
  end

  private

  def object
    id = params.require :id
    begin
      @purchase = Purchase.find id
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Not Found' }, status: :not_found
    end
  end

  def object_params
    params.require(:purchase).permit(:totalValue)
  end
end
