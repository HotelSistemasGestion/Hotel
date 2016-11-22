class AddNewValueToAccountingAccount < ActiveRecord::Migration
  def change
    add_column :accounting_accounts, :ejercicio, :integer
  end
end
