class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :nombre
      t.string :apellido
      t.string :check_in
      t.string :check_out
      t.string :type_of_room_id

      t.timestamps null: false
    end
  end
end
