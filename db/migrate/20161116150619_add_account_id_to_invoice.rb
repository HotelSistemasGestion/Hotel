class AddAccountIdToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :account_id, :integer
  end
end
