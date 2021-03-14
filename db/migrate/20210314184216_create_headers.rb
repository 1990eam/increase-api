class CreateHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :headers do |t|
      t.references :payment, null: false, foreign_key: true
      t.integer :registry_type, default: 1
      t.string :payment_identification
      t.integer :currency
      t.integer :total_amount
      t.integer :total_discounts
      t.integer :total_amount_with_discounts

      t.timestamps
    end
  end
end
