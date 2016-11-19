class AddNewValuesToCashMovements < ActiveRecord::Migration
  def change
    add_column :cash_movements, :nombre, :string
    add_column :cash_movements, :apellido, :string
    add_column :cash_movements, :ruc, :string
    add_column :cash_movements, :direccion, :string
  end
end
