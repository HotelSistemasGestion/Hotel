class AddStartEndToReservationRooms < ActiveRecord::Migration
  def change
    add_column :reservation_rooms, :start, :date
    add_column :reservation_rooms, :end, :date
  end
end
