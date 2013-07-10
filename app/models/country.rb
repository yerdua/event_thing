# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true, uniqueness: true
  
  has_many :cities
end
