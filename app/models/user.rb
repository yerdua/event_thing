# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string(255)
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username
  
  attr_accessible :username, :email, :password, :password_confirmation,
                  :session_token
  has_secure_password
  validates_presence_of :password, :password_confirmation, on: :create
  validates :username, presence: true, uniqueness: true
  
  has_many :events, foreign_key: :owner_id
  
end
