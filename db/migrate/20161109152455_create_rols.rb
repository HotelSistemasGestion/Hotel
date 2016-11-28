class CreateRols < ActiveRecord::Migration
  def change
    create_table :rols do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
