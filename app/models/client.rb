class Client < ApplicationRecord
  has_one :payment, dependent: :destroy
  has_many :payment_transactions, through: :payment, dependent: :destroy
end
