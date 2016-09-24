class CreateAccountingXAutomaticEntries < ActiveRecord::Migration
  def change
    create_table :accounting_x_automatic_entries do |t|

      t.timestamps null: false
    end
  end
end
