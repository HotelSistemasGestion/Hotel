class AddNewValueEstadoToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :estado, :string
  end
end
