class Itinerary < ActiveRecord::Base
  # Remember to create a migration!
  has_many :invites
  has_many :users, through: :invites
  has_many :destinations
end
