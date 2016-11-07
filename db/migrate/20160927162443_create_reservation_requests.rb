class CreateReservationRequests < ActiveRecord::Migration
  def change
    create_table :reservation_requests do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :telefono
      t.references :comfort, index: true, foreign_key: true
      t.integer :cantidad_de_adultos
      t.integer :cantidad_de_ninhos
      t.integer :cantidad_de_familias
      t.date :check_in
      t.date :check_out
      t.text :comentarios

      t.timestamps null: false
    end
  end
end
