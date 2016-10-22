class AddNewValuesToAccountXAutoEntries < ActiveRecord::Migration
  def change
    add_column :account_x_auto_entries, :descripcion, :string
  end
end
