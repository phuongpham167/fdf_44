class Image < ApplicationRecord
  mount_uploader :image_link, AvatarUploader
  belongs_to :product
end
