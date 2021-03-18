class PaymentTransaction < ApplicationRecord
  belongs_to :payment, optional: true
  has_one :client, through: :payment
end
