class CreateAccountingEntries < ActiveRecord::Migration
  def change
    create_table :accounting_entries do |t|
      t.integer :numero
      t.date :fecha
      t.integer :iva
      t.integer :debe
      t.integer :haber

      t.timestamps null: false
    end
  end
end
