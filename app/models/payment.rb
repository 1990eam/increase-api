class Payment < ApplicationRecord
  belongs_to :client, optional: true
  has_one :header
  has_one :footer
  has_many :payment_transactions
  has_many :discounts
end
