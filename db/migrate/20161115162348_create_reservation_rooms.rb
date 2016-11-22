class CreateReservationRooms < ActiveRecord::Migration
  def change
    create_table :reservation_rooms do |t|
      t.references :reservation, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true

      t.references :budget, index: true, foreign_key: true
      t.integer :cantidad
      t.references :type_of_room, index: true, foreign_key: true
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
