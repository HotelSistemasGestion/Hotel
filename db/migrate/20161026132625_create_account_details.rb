class CreateAccountDetails < ActiveRecord::Migration
  def change
    create_table :account_details do |t|
      t.references :account, index: true, foreign_key: true
      t.integer :service_id
      t.integer :cantidad
      t.integer :precio
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
