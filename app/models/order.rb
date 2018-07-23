class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  validates :address, :phone, presence: true

  scope :load_order, -> user_id {where user_id: user_id}
end
