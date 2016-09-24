class CreateRoomComforts < ActiveRecord::Migration
  def change
    create_table :room_comforts do |t|
      t.references :room, index: true, foreign_key: true
      t.references :comfort, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
