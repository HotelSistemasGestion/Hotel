class AddValuesTresToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :identificador_hab, :string
    add_column :accounts, :telefono, :string
    add_column :accounts, :correo, :string
  end
end
