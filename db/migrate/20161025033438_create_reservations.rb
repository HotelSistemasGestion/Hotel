class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :dias
      #
      t.references :reservation_request, index: true, foreign_key: true
      t.references :budget, index: true, foreign_key: true
      #
      t.string :total
      t.timestamps null: false
    end
  end
end
