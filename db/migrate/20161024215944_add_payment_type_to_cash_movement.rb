class AddPaymentTypeToCashMovement < ActiveRecord::Migration
  def change
    add_reference :cash_movements, :payment_type, index: true, foreign_key: true
  end
end
