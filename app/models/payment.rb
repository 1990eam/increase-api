class Payment < ApplicationRecord
  belongs_to :client
  has_one :header
  has_one :footer
  has_many :transactionables
  has_many :discounts
end
