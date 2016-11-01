class CreateComplaintServices < ActiveRecord::Migration
  def change
    create_table :complaint_services do |t|
      t.string :description
      t.timestamps null: false
    end
  end
end
