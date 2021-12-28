class Temple < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :temple_history_details, dependent: :destroy
  has_many :devoters
  has_many :offline_city_centres, dependent: :destroy
  has_many :worships, dependent: :destroy
  has_many_attached :temple_images
  belongs_to :user
end
