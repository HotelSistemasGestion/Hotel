class CreateDetailOfCashMovements < ActiveRecord::Migration
  def change
    create_table :detail_of_cash_movements do |t|
      t.integer :sub_monto

      t.timestamps null: false
    end
  end
end
