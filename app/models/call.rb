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

class Call < ActiveRecord::Base
  attr_accessible :end_time, :from_phone_number, :start_time, :to_phone_number
  belongs_to :user

  validates :user_id, presence: true

  VALID_PHONE_NUMBER_REGEX = /^\d+$/

  validates :from_phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :to_phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  default_scope order: 'calls.created_at DESC'
end
