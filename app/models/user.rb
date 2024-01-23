class User < ApplicationRecord
  has_one :user_account_link
  has_one :account, through: :user_account_link

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :profile_image_path, presence: true
  validates :fullname, presence: true
  validates :address, presence: true
end
