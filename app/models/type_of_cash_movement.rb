class TypeOfCashMovement < ActiveRecord::Base
	has_many :cash_movement

	validates :descripcion, presence: true
end
