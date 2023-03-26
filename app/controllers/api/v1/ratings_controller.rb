class Api::V1::RatingsController < ApplicationController
    def index
        @ratings = Rating.all
        render json: @ratings
    end

    def create
      @rating = Rating.new(rating_params)

      if @rating.save
        # render json: { success: @rating }, status: :created 
        render :json => { :success => "success", :status_code => "200" }
      else
        render json: { errors: @rating.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def rating_params
      params.require(:rating).permit(:product_id, :name, :stars, :comments)
    end
     
end
