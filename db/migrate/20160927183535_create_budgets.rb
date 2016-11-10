class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.references :reservation_request, index: true, foreign_key: true
      t.references :comfort, index: true, foreign_key: true
      t.text :comentario
      t.integer :descuento
      t.integer :total

      t.timestamps null: false
    end
  end
end
