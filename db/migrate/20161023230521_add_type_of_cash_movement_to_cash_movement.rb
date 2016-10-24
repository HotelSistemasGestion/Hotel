class AddTypeOfCashMovementToCashMovement < ActiveRecord::Migration
  def change
    add_reference :cash_movements, :type_of_cash_movement, index: true, foreign_key: true
  end
end
