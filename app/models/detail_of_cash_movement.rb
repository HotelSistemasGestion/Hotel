class DetailOfCashMovement < ActiveRecord::Base
	belongs_to :cash_movement
	has_many :invoice
end
