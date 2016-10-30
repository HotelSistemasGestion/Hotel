class AddPaymentTypeToDetailOfCashMovement < ActiveRecord::Migration
  def change
    add_reference :detail_of_cash_movements, :payment_type, index: true, foreign_key: true
  end
end
