class CreatePaymentTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_transactions do |t|
      t.references :payment, foreign_key: true
      t.integer :registry_type, default: 2
      t.string  :transaction_identification
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
