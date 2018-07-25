class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :images, dependent: :destroy
  has_many :order_details
  has_many :favourites
  ratyrate_rateable "rating"

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

  def self.ransackable_attributes(auth_object = nil)
    super & %w(name price average_point)
  end

  def update_avg_point
    update_attribute(:average_point, rating_average.avg)
  end
end
