class RemoveTempleImageFromTemple < ActiveRecord::Migration[6.0]
  def change
    remove_column :temples, :temple_image, :text
  end
end
