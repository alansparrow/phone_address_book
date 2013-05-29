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
#  user_id           :integer
#

class Message < ActiveRecord::Base
  attr_accessible :content, :from_phone_number, :to_phone_number
  belongs_to :user
end
