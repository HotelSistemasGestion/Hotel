class AddStateToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :state, :string
  end
end
