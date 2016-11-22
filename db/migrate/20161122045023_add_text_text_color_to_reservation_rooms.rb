class AddTextTextColorToReservationRooms < ActiveRecord::Migration
  def change
    add_column :reservation_rooms, :title, :string
    add_column :reservation_rooms, :textColor, :string
    add_column :reservation_rooms, :color, :string
  end
end
