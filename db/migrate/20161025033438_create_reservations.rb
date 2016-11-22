class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :dias
      t.date :check_in
      t.date :check_out
      t.references :room, index: true, foreign_key: true
      t.references :type_of_room, index: true, foreign_key: true
      #
      t.references :reservation_request, index: true, foreign_key: true
      t.references :budget, index: true, foreign_key: true
      #
      t.string :total
      t.timestamps null: false
    end
  end
end
