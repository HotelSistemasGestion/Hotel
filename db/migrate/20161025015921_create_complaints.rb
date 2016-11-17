class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :description
      t.references :complaint_service, index: true, foreign_key: true
      t.string :service_description
      t.boolean :state
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
