class AddNewValuesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :nombre, :string
    add_column :accounts, :direccion, :string
    add_column :accounts, :ruc, :string
  end
end
