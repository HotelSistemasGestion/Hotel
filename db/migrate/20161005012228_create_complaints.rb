class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.references :room, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
