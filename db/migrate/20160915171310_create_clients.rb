class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :email
      t.text :direccion
      t.string :cedula

      t.timestamps null: false
    end
  end
end
