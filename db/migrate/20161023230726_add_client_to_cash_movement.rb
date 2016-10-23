class AddClientToCashMovement < ActiveRecord::Migration
  def change
    add_reference :cash_movements, :client, index: true, foreign_key: true
  end
end
