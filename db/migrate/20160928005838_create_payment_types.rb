class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :total
      t.string :titular
      t.string :banco
      t.string :n_cheque
      t.string :tarjeta_tipo
      t.date :fecha_disponibilidad

      t.timestamps null: false
    end
  end
end
