# == Schema Information
#
# Table name: calls
#
#  id                :integer          not null, primary key
#  from_phone_number :string(255)
#  to_phone_number   :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#

require 'test_helper'

class CallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
