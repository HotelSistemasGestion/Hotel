class AddValueToClosingCash < ActiveRecord::Migration
  def change
    add_column :closing_cashes, :dif_registrada, :integer
  end
end
