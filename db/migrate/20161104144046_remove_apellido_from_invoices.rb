class RemoveApellidoFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :apellido, :string
  end
end
