class AddCashRefToOpeningCash < ActiveRecord::Migration
  def change
    add_reference :opening_cashes, :cash, index: true, foreign_key: true
  end
end
