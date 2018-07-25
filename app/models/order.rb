class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  validates :address, :phone, presence: true

  enum status: [:new_order, :inprogess_order, :resolved_order]

  scope :load_order, -> user_id {where user_id: user_id}
  scope :order_by_time, -> {order created_at: :desc}
  scope :order_by_status, -> { order status: :asc}
end
