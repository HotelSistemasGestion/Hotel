class AccountingEntry < ActiveRecord::Base
	has_many :account_x_entries
	has_many :cash_movement
end
