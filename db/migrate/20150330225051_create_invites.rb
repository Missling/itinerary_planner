class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :user
      t.belongs_to :itinerary

      t.timestamps
    end
  end
end
