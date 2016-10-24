class AddNewValuesToAccountXEntries < ActiveRecord::Migration
  def change
    add_column :account_x_entries, :tipo, :string
  end
end
