class AddComfortToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :comfort, index: true, foreign_key: true
  end
end
