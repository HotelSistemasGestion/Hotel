class CreateReservationRooms < ActiveRecord::Migration
  def change
    create_table :reservation_rooms do |t|
      t.integer :reservation_id
      t.string :room_id
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
