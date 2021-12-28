class AddUserIdToTemples < ActiveRecord::Migration[6.0]
  def change
    add_reference :temples, :user, foreign_key: true
  end
end
