class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :average_rating

  has_many :ratings

  def average_rating
    object.ratings.average(:stars)
  end
end