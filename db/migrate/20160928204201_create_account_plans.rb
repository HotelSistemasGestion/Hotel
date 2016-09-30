class CreateAccountPlans < ActiveRecord::Migration
  def change
    create_table :account_plans do |t|
      t.references :accounting_year, index: true, foreign_key: true
      t.string :descripcion
      t.string :estado
      t.string :version

      t.timestamps null: false
    end
  end
end
