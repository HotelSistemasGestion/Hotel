class AccountXPlan < ActiveRecord::Base
	belongs_to :account_plan
	belongs_to :accounting_account
end
