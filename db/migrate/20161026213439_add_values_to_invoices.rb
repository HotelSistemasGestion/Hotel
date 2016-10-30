class AddValuesToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :total, :integer
    add_column :invoices, :subtotal, :integer
  end
end
