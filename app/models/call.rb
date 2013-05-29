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
#  user_id           :integer
#

class Call < ActiveRecord::Base
  attr_accessible :end_time, :from_phone_number, :start_time, :to_phone_number
  belongs_to :user
end
