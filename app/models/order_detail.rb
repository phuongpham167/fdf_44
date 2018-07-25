class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :product, presence: true

  scope :load_order_details, -> order_id {where order_id: order_id}
end
