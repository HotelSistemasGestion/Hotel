class CreatePaymentValues < ActiveRecord::Migration
  def change
    create_table :payment_values do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
