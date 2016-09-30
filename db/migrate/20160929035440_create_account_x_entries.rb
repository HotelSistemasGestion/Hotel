class CreateAccountXEntries < ActiveRecord::Migration
  def change
    create_table :account_x_entries do |t|
    	 t.references :accounting_entry, index: true, foreign_key: true
    	  t.references :accounting_account, index: true, foreign_key: true
      t.integer :monto
      t.string :observacion

      t.timestamps null: false
    end
  end
end
