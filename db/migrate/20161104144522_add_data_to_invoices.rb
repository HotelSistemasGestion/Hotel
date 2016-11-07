class AddDataToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :celular, :string
    add_column :invoices, :correo, :string
  end
end
