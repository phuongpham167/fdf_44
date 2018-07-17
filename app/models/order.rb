class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  validate :address, :phone, presence: true
end
