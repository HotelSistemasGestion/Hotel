class CreateReservationRooms < ActiveRecord::Migration
  def change
    create_table :reservation_rooms do |t|
      t.references :reservation, index: true, foreign_key: true
      t.references :type_of_room, index: true, foreign_key: true
      t.references :comfort, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :subtotal,limit: 8
      t.timestamps null: false
    end
  end
end
