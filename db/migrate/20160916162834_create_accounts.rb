class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :client, index: true, foreign_key: true
      t.date :fecha_entrada
      t.date :fecha_salida
      t.integer :total

      t.timestamps null: false
    end
  end
end
