class AddIvaToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :iva, :integer
  end
end
