# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ActiveRecord::Base
  attr_accessible :tag_id, :event_id, :event, :tag_name
  
  belongs_to :event
  belongs_to :tag
  
  accepts_nested_attributes_for :tag
  
  validates :tag_id, uniqueness: { scope: :event_id }
  
  def tag_name=(name)
    self.tag = Tag.find_by_name(name) || Tag.new(name: name)
  end
end
