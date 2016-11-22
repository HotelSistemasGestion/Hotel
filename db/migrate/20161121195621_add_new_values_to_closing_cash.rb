class AddNewValuesToClosingCash < ActiveRecord::Migration
  def change
    add_column :closing_cashes, :existente_efe, :integer
    add_column :closing_cashes, :existente_cheque, :integer
    add_column :closing_cashes, :existente_tcre, :integer
    add_column :closing_cashes, :existente_tdb, :integer
  end
end
