class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.string :venue_name
      t.string :venue_address
      t.string :venue_phone
      t.string :venue_access
      t.string :venue_area
      t.integer :venue_openinghour
      t.integer :venue_closinghour
      t.string :image
      t.string :price
      t.integer :permanent_event
      t.string :description
      t.string :media
      t.string :start_date
      t.string :end_date
      t.integer :days_remaining

      t.timestamps
    end
  end
end
