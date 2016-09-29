class AccountPlan < ActiveRecord::Base
	belongs_to :accounting_year
	has_many :account_x_plans
end
