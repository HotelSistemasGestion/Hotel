class AddReservationIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :reservation_id, :integer
  end
end
