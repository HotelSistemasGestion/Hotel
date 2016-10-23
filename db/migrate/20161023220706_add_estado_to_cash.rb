class AddEstadoToCash < ActiveRecord::Migration
  def change
    add_column :cashes, :estado, :string
  end
end
