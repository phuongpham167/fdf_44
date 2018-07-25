class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user
  
  validates :point, presence: true, length: {in: Settings.ratings.point}
end
