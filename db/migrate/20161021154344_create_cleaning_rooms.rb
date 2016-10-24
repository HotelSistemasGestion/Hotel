class CreateCleaningRooms < ActiveRecord::Migration
  def change
    create_table :cleaning_rooms do |t|
      t.references :room, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.datetime :day

      t.timestamps null: false
    end
  end
end
