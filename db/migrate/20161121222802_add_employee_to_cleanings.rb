class AddEmployeeToCleanings < ActiveRecord::Migration
  def change
    add_reference :cleanings, :employee, index: true, foreign_key: true
  end
end
