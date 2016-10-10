class CreateAccountXAutoEntries < ActiveRecord::Migration
  def change
    create_table :account_x_auto_entries do |t|
    	 t.references :account_x_entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
