require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :invites
  has_many :itineraries, through: :invites

  validates :email, uniqueness:true
  validates :email, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
