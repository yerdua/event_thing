# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Venue < ActiveRecord::Base
  attr_accessible :name, :description
end
