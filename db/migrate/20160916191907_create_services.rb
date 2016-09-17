class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :precio

      t.timestamps null: false
    end
  end
end
