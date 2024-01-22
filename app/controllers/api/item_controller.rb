class Api::ItemController < ApplicationController
  before_action :getItem, only: [:update, :show, :destroy]
  before_action :getItemParams, only: [:create, :update]

  def index
    render json: Item.all, status: :ok
  end

  def show
    render json: @item, status: :ok
  end

  def create
    # render json: {messsage: "invalid params"}, :status => :bad_request if @itemParams[:name].blank? || @itemParams[:description].blank?
    item = Item.new(@itemParams)

    if item.save
      render json: item, :status => :created
    else
      render json: {:messsage => "Erro on save"}, :status => :internal_server_error
    end
  end

  def update
    begin
      @item.update_attributes(@itemParams)
      render json: @item, status: :ok
    rescue
      render json: {messsage: "Erro on save"}, status: :internal_server_error
    end
  end

  def destroy
    begin
      @item.destroy!
      render json: {:messsage => "Item id: #{@item[:id]} removed"}, :status => :ok
    rescue
      render json: {:messsage => "Erro on destroy"}, :status => :internal_server_error
    end
  end

  private
  def getItem
    id = params.require :id
    begin
      @item = Item.find id
    rescue ActiveRecord::RecordNotFound
      render json: {:messsage => "not_found"}, status: :not_found
    end
  end

  def getItemParams
    @itemParams = params.require(:item).permit(:name, :description)
  end

end
