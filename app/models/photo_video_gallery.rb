class PhotoVideoGallery < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :temple
  has_one_attached :temple_photo
  has_one_attached :temple_video

  def to_hash
    {
      temple_id: self.temple_id,
      photo_url: self.photo_url,
      video_url: self.video_url,
      gallery_photo: self.temple_photo_url,
      # gallery_video: self.temple_video_url
    }
  end

  def temple_photo_url
    url_for(self.temple_photo) if self.temple_photo&.attached?
    # self&.temple_photo&.service_url if self.temple_photo&.attached?
  end

  # def temple_video_url
  #   self&.temple_video&.service_url if self.temple_video&.attached?
  # end
end
