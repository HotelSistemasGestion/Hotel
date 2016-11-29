class AddServiceToAccountDetails < ActiveRecord::Migration
  def change
    add_column :account_details, :servicio, :string
  end
end
