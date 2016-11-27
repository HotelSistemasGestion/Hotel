class AddAccountToAccountXEntry < ActiveRecord::Migration
  def change
    add_column :account_x_entries, :account, :string
  end
end
