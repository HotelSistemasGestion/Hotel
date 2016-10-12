class AddNewValuesToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :nombre, :string
    add_column :invoices, :apellido, :string
    add_column :invoices, :direccion, :string
    add_column :invoices, :ruc, :string
  end
end
