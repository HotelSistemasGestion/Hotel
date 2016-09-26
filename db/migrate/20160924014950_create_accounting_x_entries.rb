class CreateAccountingXEntries < ActiveRecord::Migration
  def change
    create_table :accounting_x_entries do |t|
      t.integer :monto
      t.string :observacion

      t.timestamps null: false
    end
  end
end
