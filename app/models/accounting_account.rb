class AccountingAccount < ActiveRecord::Base
	audited
	has_many :account_x_plans
	has_many :account_x_entries
	has_many :account_x_auto_entry_dets
	has_many :account_x_plans,:dependent => :destroy
	validates_presence_of :grupo 
	attr_accessor :plan
	attr_accessor :eje1
	

end
