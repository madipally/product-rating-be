class Api::V1::RatingsController < ApplicationController
    def index
        @ratings = Rating.all
        render json: @ratings
    end

    def create
      @rating = Rating.new(rating_params)
      if @rating.save
        render json: @rating, status: :created
      else
        render json: { errors: @rating.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def rating_params
      params.require(:rating).permit(:stars, :product_id)
    end
     
end
