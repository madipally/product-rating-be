class Api::V1::ProductsController < ApplicationController
    def index
        @products =  Product.includes(:ratings).limit(5)
        @product_with_ratings ||= []
        @products.each do |product|
            ratings = product.ratings.map(&:stars)
                ratings_sum = ratings.reduce(:+)
                avg_rating = ratings_sum.nil? ? 0 : ratings_sum / ratings.size 
                @product_with_ratings << {
                    id: product.id, 
                    name: product.name, 
                    description: product.description,
                    average_rating: avg_rating
                }
        end 
        render json: @product_with_ratings
    end

    def show
        @product = Product.find(params[:id])
        @average_rating = @product.ratings.average(:stars)
        render json: { product: @product, average_rating: @average_rating }
    end
end
  