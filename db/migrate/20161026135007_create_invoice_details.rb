class CreateInvoiceDetails < ActiveRecord::Migration
  def change
    create_table :invoice_details do |t|
      t.integer :invoice_id
      t.integer :service_id
      t.integer :cantidad
      t.integer :precio
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
