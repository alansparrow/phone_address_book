# == Schema Information
#
# Table name: calls
#
#  id                :integer          not null, primary key
#  from_phone_number :string(255)
#  to_phone_number   :string(255)
#  start_time        :datetime
#  end_time          :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
