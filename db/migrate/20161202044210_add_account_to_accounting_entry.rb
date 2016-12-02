class AddAccountToAccountingEntry < ActiveRecord::Migration
  def change
    add_column :accounting_entries, :num_factura, :integer
  end
end
