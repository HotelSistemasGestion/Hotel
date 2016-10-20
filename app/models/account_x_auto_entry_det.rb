class AccountXAutoEntryDet < ActiveRecord::Base
	belongs_to :account_x_auto_entry
	belongs_to :accounting_account
end
