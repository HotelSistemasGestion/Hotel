class AddNewValuesToClients < ActiveRecord::Migration
  def change
    add_column :clients, :ruc, :string
  end
end
