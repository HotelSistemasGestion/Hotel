class AccountPlan < ActiveRecord::Base
	has_many :accounting_years
	has_many :account_x_plans
	attr_accessor :eje1
	has_many :accounting_years,:dependent => :destroy
	accepts_nested_attributes_for :accounting_years, allow_destroy: true , update_only: true
end
