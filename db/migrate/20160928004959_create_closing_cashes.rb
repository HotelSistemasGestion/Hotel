class CreateClosingCashes < ActiveRecord::Migration
  def change
    create_table :closing_cashes do |t|
      t.date :fecha_cierre
      t.integer :monto_efectivo
      t.integer :monto_cheque
      t.integer :monto_tcredito
      t.integer :monto_tdebito

      t.timestamps null: false
    end
  end
end
