class CreateBudgetDetails < ActiveRecord::Migration
  def change
    create_table :budget_details do |t|
      t.references :budget, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.integer :cantidad
      t.integer :subtotal
      t.timestamps null: false
    end
  end
end
