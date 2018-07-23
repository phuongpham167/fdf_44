class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :images, dependent: :destroy
  has_many :order_details
  has_many :favourites

  delegate :name, to: :category, prefix: true
  validates :name, :price, :descriptions, presence: true

  scope :order_by_name, -> { order name: :asc}
  scope :order_by_time, (lambda do
    where("created_at >= ?", Settings.product_time_new.days.ago)
    .order("created_at desc")
  end)
  scope :load_product, -> product_ids {where id: product_ids}

  def new_product?
    created_at >= Settings.product_time_new.hours.ago
  end
end
