class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.references :payment, null: false, foreign_key: true
      t.integer :registry_type, default: 3
      t.integer :amount
      t.integer :discount_type

      t.timestamps
    end
  end
end
