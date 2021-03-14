class CreateTransactionables < ActiveRecord::Migration[6.0]
  def change
    create_table :transactionables do |t|
      t.references :payment, null: false, foreign_key: true
      t.integer :registry_type, default: 2
      t.integer :amount
      t.integer :status

      t.timestamps
    end
  end
end
