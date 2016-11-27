class AddNewValuesToOpeningCash < ActiveRecord::Migration
  def change
    add_column :opening_cashes, :final_cheque, :integer
    add_column :opening_cashes, :final_credito, :integer
    add_column :opening_cashes, :final_debito, :integer
  end
end
