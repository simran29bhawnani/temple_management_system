class PhotoVideoGallery < ApplicationRecord
  belongs_to :temple
  has_one_attached :temple_photo
  has_one_attached :temple_video

  def to_hash
    {
      temple_id: self.temple_id,
      gallery_photo: self.temple_logo
    }
  end

  def temple_logo
    self&.temple_photo&.service_url if self.temple_photo&.attached?
  end
end
