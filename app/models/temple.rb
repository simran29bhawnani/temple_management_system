class Temple < ApplicationRecord
  has_many :temple_history_details, dependent: :destroy
  has_many :devoters
  has_many :offline_city_centres, dependent: :destroy
  has_many :worships, dependent: :destroy
  has_one_attached :temple_image
  belongs_to :user
end
