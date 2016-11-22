class AddPaymentValueRefToPaymentTypes < ActiveRecord::Migration
  def change
    add_reference :payment_types, :payment_value, index: true, foreign_key: true
  end
end
