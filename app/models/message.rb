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

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  # VALID_PHONE_NUMBER_REGEX = /^\d+$/

  # validates :from_phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  # validates :to_phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  default_scope order: 'messages.created_at DESC'
end
