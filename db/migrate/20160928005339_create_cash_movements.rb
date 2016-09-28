class CreateCashMovements < ActiveRecord::Migration
  def change
    create_table :cash_movements do |t|
      t.integer :monto_total

      t.timestamps null: false
    end
  end
end
