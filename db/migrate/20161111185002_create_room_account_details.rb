class CreateRoomAccountDetails < ActiveRecord::Migration
  def change
    create_table :room_account_details do |t|
      t.integer :account_id
      t.integer :room_id
      t.integer :precio

      t.timestamps null: false
    end
  end
end
