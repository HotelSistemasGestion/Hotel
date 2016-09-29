class CreateTypeOfCashMovements < ActiveRecord::Migration
  def change
    create_table :type_of_cash_movements do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
