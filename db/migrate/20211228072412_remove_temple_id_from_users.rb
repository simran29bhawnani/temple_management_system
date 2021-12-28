class RemoveTempleIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :temple_id, :integer
  end
end
