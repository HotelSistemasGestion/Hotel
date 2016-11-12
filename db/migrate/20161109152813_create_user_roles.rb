class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :rol, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
