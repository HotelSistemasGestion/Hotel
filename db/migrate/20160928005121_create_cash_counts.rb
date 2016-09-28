class CreateCashCounts < ActiveRecord::Migration
  def change
    create_table :cash_counts do |t|
      t.date :fecha_arqueo

      t.timestamps null: false
    end
  end
end
