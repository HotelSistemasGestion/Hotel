class AddPrecioToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :precio, :integer
  end
end
