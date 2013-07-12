# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  
  attr_accessible :name
  
  before_save { |tag| tag.name = tag.name.downcase }
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
                   
  has_many :taggings
  has_many :events, through: :taggings
  
  def as_json(options = {})
    super(options.merge(methods: [:name, :id]))
  end
end
