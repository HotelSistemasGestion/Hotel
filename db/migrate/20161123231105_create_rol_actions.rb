class CreateRolActions < ActiveRecord::Migration
  def change
    create_table :rol_actions do |t|
      t.references :rol, index: true, foreign_key: true
      t.references :action, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
