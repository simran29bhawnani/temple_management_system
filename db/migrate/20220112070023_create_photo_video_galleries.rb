class CreatePhotoVideoGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_video_galleries do |t|
      t.references :temple, foreign_key: true

      t.timestamps
    end
  end
end
