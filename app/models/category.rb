class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  delegate :name, to: :product, prefix: true

  validates :name, presence: true
end
