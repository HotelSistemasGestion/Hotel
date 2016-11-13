class AddCashMovementRefToPaymentTypes < ActiveRecord::Migration
  def change
    add_reference :payment_types, :cash_movement, index: true, foreign_key: true
  end
end
