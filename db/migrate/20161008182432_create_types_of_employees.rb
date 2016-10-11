class CreateTypesOfEmployees < ActiveRecord::Migration
  def change
    create_table :types_of_employees do |t|
      t.string :tipo
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
