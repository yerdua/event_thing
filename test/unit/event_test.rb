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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
