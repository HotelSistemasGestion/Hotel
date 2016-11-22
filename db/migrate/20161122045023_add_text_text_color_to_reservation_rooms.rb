class AddTextTextColorToReservationRooms < ActiveRecord::Migration
  def change
    add_column :reservation_rooms, :text, :string
    add_column :reservation_rooms, :textColor, :string
  end
end
