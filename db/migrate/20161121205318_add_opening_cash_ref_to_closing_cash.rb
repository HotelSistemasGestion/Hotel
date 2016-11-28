class AddOpeningCashRefToClosingCash < ActiveRecord::Migration
  def change
    add_reference :closing_cashes, :opening_cash, index: true, foreign_key: true
  end
end
