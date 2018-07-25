class ProductTemp < ApplicationRecord
  belongs_to :user

  enum status: [:waitting, :approve]

  scope :load_product_temps, -> user_id {where user_id: user_id}
  scope :order_by_time, -> {order created_at: :desc}
  scope :order_by_status, -> { order status: :asc}
end
