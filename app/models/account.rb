class Account < ApplicationRecord
  has_one :user_account_link
  has_one :user, through: :user_account_link

  validates :savings_account, :investment_account, :earnings, :stakes, presence: true
  validates :savings_account, :investment_account, :earnings, :stakes, numericality: { greater_than_or_equal_to: 0 }
end
