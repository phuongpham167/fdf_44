class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :load_like, -> user_id {where user_id: user_id}
end
