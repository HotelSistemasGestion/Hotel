class AddAutoToAccountingEntry < ActiveRecord::Migration
  def change
    add_column :accounting_entries, :auto, :integer
  end
end
