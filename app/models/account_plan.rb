class AccountPlan < ActiveRecord::Base
	belongs_to :accounting_year
	has_many :account_x_plans

	accepts_nested_attributes_for :accounting_year, allow_destroy: true , update_only: true

end
