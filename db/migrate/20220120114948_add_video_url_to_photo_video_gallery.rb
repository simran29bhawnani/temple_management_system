class AddVideoUrlToPhotoVideoGallery < ActiveRecord::Migration[6.0]
  def change
    add_column :photo_video_galleries, :video_url, :string
  end
end
