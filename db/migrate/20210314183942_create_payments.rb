class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
