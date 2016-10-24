class CashMovement < ActiveRecord::Base
	belongs_to :type_of_cash_movement
	belongs_to :opening_cash
	belongs_to :accounting_entry
	belongs_to :client

	has_many :detail_of_cash_movement

	accepts_nested_attributes_for :detail_of_cash_movement, allow_destroy: true , update_only: true

end
