class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :types_of_employee, index: true, foreign_key: true
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.integer :cedula
      t.integer :telefono
      t.string :correo
      t.string :direccion
      t.integer :hijo

      t.timestamps null: false
    end
  end
end
