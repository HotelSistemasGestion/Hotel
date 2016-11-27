class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :telefono
      t.references :budget_id #NO PUEDE SER FK POR QUE HAY RESERVAS SIN PRESUPIUESTO!
      t.string :total, limit: 8
      t.timestamps null: false
    end
  end
end
