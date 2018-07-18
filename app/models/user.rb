class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :product_temps
end
