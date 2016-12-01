class AddParentToAccountingAccount < ActiveRecord::Migration
  def change
    add_column :accounting_accounts, :parent_id, :integer
  end
end
