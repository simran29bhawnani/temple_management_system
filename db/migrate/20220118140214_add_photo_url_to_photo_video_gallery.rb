class AddPhotoUrlToPhotoVideoGallery < ActiveRecord::Migration[6.0]
  def change
    add_column :photo_video_galleries, :photo_url, :string
  end
end
