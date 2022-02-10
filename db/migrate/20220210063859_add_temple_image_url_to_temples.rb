class AddTempleImageUrlToTemples < ActiveRecord::Migration[6.0]
  def change
    add_column :temples, :temple_image_url, :string
  end
end
