class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.belongs_to :itinerary
      t.string :name
      t.integer :yelp_business_id
      t.string :address
      
      t.timestamps
    end

  end
end
