class AddCashMovementToTypeOfCashMovement < ActiveRecord::Migration
  def change
    add_reference :type_of_cash_movements, :cash_movement, index: true, foreign_key: true
  end
end
