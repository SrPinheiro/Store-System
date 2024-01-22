  class Api::CategoryController < ApplicationController
    before_action :getCategory, only: [:update, :show, :destroy]
    before_action :getCategoryParams, only: [:create, :update]

      def index
        render json: ProductCategory.all, status: :ok
      end

      def show
        render json: @category, status: :ok
      end

      def create
        render json: {messsage: "invalid params"}, :status => :bad_request if @categoryParams[:name].blank? || @categoryParams[:description].blank?
        category = ProductCategory.new(@categoryParams)
        result = category.save
        if result
          render json: category, :status => :created
        else
         render json: {:messsage => "Erro on save"}, :status => :internal_server_error
        end
      end

      def update
        begin
          @category.update!(@categoryParams)
          render json: @category, :status => :ok
        rescue
          render json: {:messsage => "Erro on save"}, :status => :internal_server_error
        end
      end

      def destroy
        begin
          @category.destroy!
          render json: {:messsage => "Category id: #{@category[:id]} removed"}, :status => :ok
        rescue
          render json: {:messsage => "Erro on destroy"}, :status => :internal_server_error
          end
      end

      private
      def getCategory
        id = params.require :id
        begin
          @category = ProductCategory.find id
        rescue ActiveRecord::RecordNotFound
          render json: {:messsage => "not_found"}, status: :not_found
        end
      end

      def getCategoryParams
        @categoryParams = params.require(:category).permit(:name, :description)
      end
  end
