class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :type_of_room, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.integer :capacidad
      t.string :identificador

      t.timestamps null: false
    end
  end
end
