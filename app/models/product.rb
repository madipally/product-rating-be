class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    has_many :ratings
  end
