class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :banco
      t.string :titular
      t.date :fecha_disponibilidad
      t.string :n_cheque
      t.integer :total

      t.timestamps null: false
    end
  end
end
