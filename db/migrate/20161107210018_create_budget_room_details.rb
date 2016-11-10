class CreateBudgetRoomDetails < ActiveRecord::Migration
  def change
    create_table :budget_room_details do |t|
      t.references :budget, index: true, foreign_key: true
      t.integer :cantidad
      t.references :type_of_room, index: true, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
