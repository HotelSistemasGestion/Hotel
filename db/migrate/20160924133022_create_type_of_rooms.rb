class CreateTypeOfRooms < ActiveRecord::Migration
  def change
    create_table :type_of_rooms do |t|
      t.string :tipo
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
