require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      rating = FactoryBot.create(:rating)
      expect(rating).to be_valid
    end

    it "is not valid without valid attributes" do
        rating = Rating.create(stars: 3)
        expect(rating).not_to be_valid
    end
  end
end
