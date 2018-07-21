class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  delegate :name, to: :product, prefix: true

  validates :name, presence: true

  scope :order_by_time, -> {order created_at: :desc}
  scope :select_column, -> {select :id, :name}
end
