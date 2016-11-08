class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :nombre
      t.string :email
      t.string :dias
      t.string :type_of_room_id
      t.string :total

      t.timestamps null: false
    end
  end
end
