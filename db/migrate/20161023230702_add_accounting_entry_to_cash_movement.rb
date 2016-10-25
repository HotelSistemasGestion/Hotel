class AddAccountingEntryToCashMovement < ActiveRecord::Migration
  def change
    add_reference :cash_movements, :accounting_entry, index: true, foreign_key: true
  end
end
