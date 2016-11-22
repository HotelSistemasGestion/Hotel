class AccountingAccount < ActiveRecord::Base
	has_many :account_x_plans
	has_many :account_x_entries
	has_many :account_x_auto_entry_dets
	
	attr_accessor :plan
	attr_accessor :eje1
end
