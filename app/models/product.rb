class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :images, dependent: :destroy
  has_many :order_details
  has_many :favourites

  validates :name, :price, :descriptions, presence: true
end
