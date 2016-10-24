class CreateAccountXAutoEntryDets < ActiveRecord::Migration
  def change
    create_table :account_x_auto_entry_dets do |t|
      t.string :imputable_tipo
      t.references :account_x_auto_entry, index: true, foreign_key: true
      t.references :accounting_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
