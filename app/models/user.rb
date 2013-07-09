class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username
  
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :password_confirmation, on: :create
  validates :username, presence: true, uniqueness: true
end
