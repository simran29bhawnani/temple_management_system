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

  def self.upload_image_to_s3(logo)
    begin
      credentials = Aws::Credentials.new(ENV['BUCKETEER_AWS_ACCESS_KEY_ID'], ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY'])
      s3 = Aws::S3::Resource.new(region:'ap-south-1', credentials: credentials)
      obj = s3.bucket('gallery-images-video').object(logo.original_filename)
      obj.put(body: logo.tempfile, acl: 'public-read')
    rescue
      raise 'failed to upload'
    end
    obj
  end
end
