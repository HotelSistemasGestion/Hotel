class CreateCashes < ActiveRecord::Migration
  def change
    create_table :cashes do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
