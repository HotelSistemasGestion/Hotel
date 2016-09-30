class AccountingAccount < ActiveRecord::Base
	has_many :account_x_plans
	has_many :account_x_entries
end
