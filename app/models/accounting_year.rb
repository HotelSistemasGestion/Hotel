class AccountingYear < ActiveRecord::Base
	belongs_to :account_plan
	attr_accessor :eje
	attr_accessor :plane
end
