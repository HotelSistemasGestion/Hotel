class CreateRoomAccountDetails < ActiveRecord::Migration
  def change
    create_table :room_account_details do |t|
      t.references :account, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.references :type_of_room, index: true, foreign_key: true
      t.references :comfort, index: true, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :subtotal,limit: 8
      t.timestamps null: false
    end
  end
end
