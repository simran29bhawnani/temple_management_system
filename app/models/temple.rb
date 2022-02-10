class Temple < ApplicationRecord
  has_many :temple_history_details, dependent: :destroy
  has_many :devoters
  has_many :offline_city_centres, dependent: :destroy
  has_many :worships, dependent: :destroy
  has_many :events, dependent: :destroy
  has_one_attached :temple_image
  belongs_to :user

  def to_hash
    {
      id: self.id,
      temple_name: self.temple_name,
      description: self.description,
      temple_email: self.temple_email,
      phone_no: self.phone_no,
      temple_address: self.temple_address,
      city: self.city,
      state: self.state,
      country: self.country,
      zipcode: self.zipcode,
      start_time: self.start_time,
      end_time: self.end_time,
      user_id: self.user_id,
      logo: self.temple_logo
    }
  end

  def temple_logo
    self&.temple_image&.service_url if self.temple_image&.attached?
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
