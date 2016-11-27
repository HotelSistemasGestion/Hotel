class AddNewValueToOpeningCash < ActiveRecord::Migration
  def change
    add_column :opening_cashes, :final_efectivo, :integer
  end
end
