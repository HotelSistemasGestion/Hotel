class AccountingEntry < ActiveRecord::Base
	has_many :account_x_entries
	has_many :cash_movement
	attr_accessor :cuenta
	accepts_nested_attributes_for :account_x_entries, allow_destroy: true , update_only: true
end
