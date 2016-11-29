class AddValueToCashMovement < ActiveRecord::Migration
  def change
    add_column :cash_movements, :fecha, :date
  end
end
