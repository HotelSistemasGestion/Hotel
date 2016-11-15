class AddNumberToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :numero, :string
  end
end
