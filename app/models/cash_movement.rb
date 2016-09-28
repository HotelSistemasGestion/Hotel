class CashMovement < ActiveRecord::Base
	belongs_to :type_of_cash_movement
	belongs_to :opening_cash
	has_many :detail_of_cash_movement
end
