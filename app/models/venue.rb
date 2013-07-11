# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  address     :string(255)
#  city        :string(255)
#  country     :string(255)
#  state_code  :string(255)
#  url         :string(255)
#

class Venue < ActiveRecord::Base
  attr_accessor :full_address
  geocoded_by :full_address
  after_validation :geocode, :reverse_geocode
  attr_accessible :name, :description, :full_address, :url
    
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address = geo.address
      obj.city = geo.city
      obj.country = geo.country
      obj.state_code = geo.state_code
    end
  end
  
  has_many :events
  
end
