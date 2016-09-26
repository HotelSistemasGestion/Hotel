class CreateAccountXPlans < ActiveRecord::Migration
  def change
    create_table :account_x_plans do |t|
      t.string :cuenta_superior

      t.timestamps null: false
    end
  end
end
