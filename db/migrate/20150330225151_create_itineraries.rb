class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
