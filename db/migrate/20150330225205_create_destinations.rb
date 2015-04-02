class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.belongs_to :itinerary
      t.string :name
      t.string :yelp_url
      t.string :address
      t.string :image_url
      t.integer :review_count
      
      t.timestamps
    end

  end
end
