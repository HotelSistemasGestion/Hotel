class AddEmployeRefToOpeningCash < ActiveRecord::Migration
  def change
    add_reference :opening_cashes, :employee, index: true, foreign_key: true
  end
end
