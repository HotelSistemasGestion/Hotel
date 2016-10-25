class AddNewValuesToCleaningRooms < ActiveRecord::Migration
  def change
    add_column :cleaning_rooms, :start, :date
    add_column :cleaning_rooms, :end, :date
    add_column :cleaning_rooms, :title, :string
    add_column :cleaning_rooms, :color, :string
    add_column :cleaning_rooms, :textColor, :string
  end
end
