class AddIvaToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :iva, :integer
  end
end
