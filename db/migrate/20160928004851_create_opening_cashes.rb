class CreateOpeningCashes < ActiveRecord::Migration
  def change
    create_table :opening_cashes do |t|
      t.date :fecha_apertura
      t.integer :monto_efectivo

      t.timestamps null: false
    end
  end
end
