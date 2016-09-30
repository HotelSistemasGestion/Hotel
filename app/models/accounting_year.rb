class AccountingYear < ActiveRecord::Base
	has_many :account_plans
end
