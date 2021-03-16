class PaymentTransaction < ApplicationRecord
  belongs_to :payment, optional: true
end
