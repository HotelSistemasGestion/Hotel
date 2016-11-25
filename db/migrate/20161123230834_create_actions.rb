class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :accion

      t.timestamps null: false
    end
  end
end
