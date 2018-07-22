class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :product, presence: true
end
