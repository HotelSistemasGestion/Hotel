class AddValueToService < ActiveRecord::Migration
  def change
    add_column :services, :cuenta_padre, :string
  end
end
