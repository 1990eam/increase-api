class AddAmountToBePaidToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :amount_to_be_paid, :integer, default: 0
    add_column :clients, :date_to_be_paid, :string
    add_column :clients, :amount_paid, :integer, default: 0
    add_column :clients, :date_paid, :string
    add_column :clients, :total_transactions, :integer
  end
end
