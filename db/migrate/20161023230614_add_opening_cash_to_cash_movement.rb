class AddOpeningCashToCashMovement < ActiveRecord::Migration
  def change
    add_reference :cash_movements, :opening_cash, index: true, foreign_key: true
  end
end
