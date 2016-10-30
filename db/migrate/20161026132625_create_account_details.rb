class CreateAccountDetails < ActiveRecord::Migration
  def change
    create_table :account_details do |t|
      t.integer :account_id
      t.integer :service_id
      t.integer :cantidad
      t.integer :precio
      t.integer :subtotal

      t.timestamps null: false
    end
  end
end
