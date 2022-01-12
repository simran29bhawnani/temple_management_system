class PhotoVideoGallery < ApplicationRecord
  belongs_to :temple
  has_one_attached :temple_photo
  has_one_attached :temple_video

  def to_hash
    {
      temple_id: self.temple_id,
      gallery_photo: self.temple_photo_url,
      gallery_video: self.temple_video_url
    }
  end

  def temple_photo_url
    self&.temple_photo&.service_url if self.temple_photo&.attached?
  end

  def temple_video_url
    self&.temple_video&.service_url if self.temple_video&.attached?
  end
end
