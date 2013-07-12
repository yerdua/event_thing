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
#  url         :string(255)
#

class Event < ActiveRecord::Base
  attr_accessible :title, :description, :venue_id, :owner_id,
                  :start_time, :end_time, :tag_names, :url
  validates :title, :start_time, :end_time, presence: true
  validate :start_time_is_before_end_time
  
  belongs_to :venue
  belongs_to :owner, class_name: 'User'
  
  has_many :taggings
  has_many :tags, through: :taggings
  
  default_scope order('start_time ASC')
  
  def as_json(options = {})
    super(options.merge(methods: [:venue, :tags]))
  end
  
  def tag_names=(tag_name_string)
    tag_names = tag_name_string.split(',').map { |tn| tn.strip }
    
    tag_names.each do |tag_name|
      self.taggings.build(tag_name: tag_name)
    end
  end
  
  def start_time_is_before_end_time
    if self.start_time && self.end_time && self.start_time > self.end_time
      errors.add(:start_time, "can't be after end time")
    end
  end
  
end
