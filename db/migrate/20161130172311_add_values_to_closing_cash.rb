class AddValuesToClosingCash < ActiveRecord::Migration
  def change
    add_column :closing_cashes, :dif_efectivo, :integer
    add_column :closing_cashes, :dif_cheque, :integer
    add_column :closing_cashes, :dif_credito, :integer
    add_column :closing_cashes, :dif_debito, :integer
  end
end
