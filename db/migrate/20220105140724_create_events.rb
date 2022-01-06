class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :event_description
      t.date :event_date
      t.time :event_time
      t.string :event_address
      t.references :temple, foreign_key: true

      t.timestamps
    end
  end
end
