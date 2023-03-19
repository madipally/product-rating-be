require 'rails_helper'

RSpec.describe "Products API", type: :request do
  describe "GET /products" do
    it "returns a list of products" do
      FactoryBot.create_list(:product, 5)

      get "/api/v1/products"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end
end
