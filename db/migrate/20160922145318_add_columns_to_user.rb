class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :apellido, :string
    add_column :users, :numero_ci, :integer
    add_column :users, :telefono, :string
    add_column :users, :celular, :string
  end
end
