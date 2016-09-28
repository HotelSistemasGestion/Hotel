class CreateDetailOfPaymentTypes < ActiveRecord::Migration
  def change
    create_table :detail_of_payment_types do |t|
      t.string :titular
      t.string :banco
      t.integer :numero
      t.string :tipo_tarjeta
      t.date :fecha_disponibilidad

      t.timestamps null: false
    end
  end
end
