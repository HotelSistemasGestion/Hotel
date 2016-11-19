class AddAccountPlanRefToAccountingYears < ActiveRecord::Migration
  def change
    add_reference :accounting_years, :account_plan, index: true, foreign_key: true
  end
end
