class AddTempleImageToTemple < ActiveRecord::Migration[6.0]
  def change
    add_column :temples, :temple_image, :text
  end
end
