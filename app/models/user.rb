# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  phone_number    :string(255)
#  email           :string(255)
#  address         :string(255)
#  company         :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :address, :company, :email, :first_name, :last_name, :password_digest, :phone_number
end
