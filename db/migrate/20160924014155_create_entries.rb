class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :numero
      t.date :fecha
      t.integer :debe
      t.integer :haber

      t.timestamps null: false
    end
  end
end
