# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  from_phone_number :string(255)
#  to_phone_number   :string(255)
#  content           :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
