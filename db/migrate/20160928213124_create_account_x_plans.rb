class CreateAccountXPlans < ActiveRecord::Migration
  def change
    create_table :account_x_plans do |t|
    	 t.references :account_plan, index: true, foreign_key: true
    	  t.references :accounting_account, index: true, foreign_key: true
          t.integer :cuenta_superior

      t.timestamps null: false
    end
  end
end
