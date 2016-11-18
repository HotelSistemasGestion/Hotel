class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :numero
      t.references :client, index: true, foreign_key: true
      t.date :fecha
      t.integer :descuento

      t.timestamps null: false
    end
  end
end