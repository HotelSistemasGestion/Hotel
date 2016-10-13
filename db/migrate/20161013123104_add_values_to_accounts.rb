class AddValuesToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :room_id, :integer
  end
end
