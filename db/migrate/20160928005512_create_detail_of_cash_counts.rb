class CreateDetailOfCashCounts < ActiveRecord::Migration
  def change
    create_table :detail_of_cash_counts do |t|
      t.integer :monto_sistema
      t.integer :monto_caja

      t.timestamps null: false
    end
  end
end
