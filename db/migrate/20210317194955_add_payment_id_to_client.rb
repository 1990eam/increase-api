class AddPaymentIdToClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :payment, foreign_key: true
  end
end
