class Payment < ApplicationRecord
  belongs_to :client, optional: true, dependent: :destroy
  has_one :header, dependent: :destroy
  has_one :footer, dependent: :destroy
  has_many :payment_transactions, dependent: :destroy
  has_many :discounts, dependent: :destroy
end
