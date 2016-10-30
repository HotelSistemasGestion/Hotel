class CreateCleanings < ActiveRecord::Migration
  def change
    create_table :cleanings do |t|
      t.references :cleaning_room, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.date :start
      t.date :end
      t.string :title

      t.timestamps null: false
    end
  end
end
