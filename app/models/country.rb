class Country < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true, uniquness: true
  
  has_many :cities
end
