module UploadImage
  extend ActiveSupport::Concern

  #upload image to s3 code
  # def self.upload_image_to_s3(logo)
  #   begin
  #     credentials = Aws::Credentials.new(ENV['BUCKETEER_AWS_ACCESS_KEY_ID'], ENV['BUCKETEER_AWS_SECRET_ACCESS_KEY'])
  #     s3 = Aws::S3::Resource.new(region:'ap-south-1', credentials: credentials)
  #     obj = s3.bucket('gallery-images-video').object(logo.original_filename)
  #     obj.put(body: logo.tempfile, acl: 'public-read')
  #   rescue
  #     raise 'failed to upload'
  #   end
  #   obj
  # end
end
