class AccountingEntry < ActiveRecord::Base
	has_many :account_x_entries
end
