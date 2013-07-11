# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text
#  venue_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer
#  start_time  :datetime         not null
#  end_time    :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :title, :description, :venue_id, :owner_id,
                  :start_time, :end_time
  validates :title, :start_time, :end_time, presence: true
  validate :start_time_is_before_end_time
  
  belongs_to :venue
  belongs_to :owner, class_name: 'User'
  
  def start_time_is_before_end_time
    if self.start_time && self.end_time && self.start_time > self.end_time
      errors.add(:start_time, "can't be after end time")
    end
  end
end
