class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  delegate :name, to: :product, prefix: true

  validates :name, presence: true

  scope :order_by_time, -> {order created_at: :desc}
  scope :order_by_name, -> {order name: :asc}
  scope :select_fields, -> {select :id, :name}
end
