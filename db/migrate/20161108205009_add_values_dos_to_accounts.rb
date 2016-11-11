class AddValuesDosToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :subtotal, :integer
    add_column :accounts, :descuento, :integer
  end
end
