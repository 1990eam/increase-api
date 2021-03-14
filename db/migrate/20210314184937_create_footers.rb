class CreateFooters < ActiveRecord::Migration[6.0]
  def change
    create_table :footers do |t|
      t.references :payment, null: false, foreign_key: true
      t.integer :registry_type, default: 4
      t.string :payment_date
      t.string :client_identification

      t.timestamps
    end
  end
end
