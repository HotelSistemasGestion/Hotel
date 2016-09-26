class CreateComforts < ActiveRecord::Migration
  def change
    create_table :comforts do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
