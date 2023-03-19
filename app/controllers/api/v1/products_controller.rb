class Api::V1::ProductsController < ApplicationController
    def index
        @products = Product.all
        render json: @products, each_serializer: ProductSerializer
    end

    def show
        @product = Product.find(params[:id])
        @average_rating = @product.ratings.average(:stars)
        render json: { product: @product, average_rating: @average_rating }
    end
end
  