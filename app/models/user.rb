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
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :address, :company, :email, :first_name, :last_name, :password, :password_confirmation, :phone_number
  has_many :contacts, dependent: :destroy
  has_many :calls, dependent: :destroy
  has_many :messages, dependent: :destroy

  # validates :first_name, presence: true, length: { maximum: 50 }
  # validates :last_name, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  
  VALID_PHONE_NUMBER_REGEX = /^\d+$/

  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  # before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_secure_password

  default_scope order: 'users.first_name ASC'

  private

    def create_remember_token 
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
