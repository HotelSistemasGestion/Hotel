class AddInvoiceRefToDetailOfCashMovement < ActiveRecord::Migration
  def change
    add_reference :detail_of_cash_movements, :invoice, index: true, foreign_key: true
  end
end
