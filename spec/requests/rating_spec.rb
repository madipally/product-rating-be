require 'rails_helper'

RSpec.describe Rating, type: :request do
  let(:headers) do 
    { 'Content-Type': 'application/json' } 
  end

  describe 'POST /ratings' do
    let(:valid_attributes) do
      { 
        "rating": { 
            "stars": 4,
            "product_id": 1
         } 
      }
    end

    context 'when the request is valid' do
      before do 
        FactoryBot.create(:product)
        post '/api/v1/ratings', params: valid_attributes.to_json, headers: headers 
      end

      it 'creates a rating' do
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "GET /ratings" do
    it "returns products ratings" do
      product = FactoryBot.create(:product)
      FactoryBot.create_list(:rating, 5, product: product)
      get "/api/v1/ratings"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end
end
