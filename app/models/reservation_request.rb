class ReservationRequest < ActiveRecord::Base
	belongs_to :type_of_room
	has_many :budgets
end
