class Advertisement < ApplicationRecord
  belongs_to :client
  belongs_to :industry

  mount_uploader :banner_image, BannerImageUploader
end
