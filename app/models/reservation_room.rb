class ReservationRoom < ActiveRecord::Base
	belongs_to :reservation
	
	belongs_to :budget
	belongs_to :type_of_room

	belongs_to :comfort

	#validates :subtotal, :presence => {:message => "No puede dejar en blanco Cantidad" }, 
	#:numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}

	#validates :reservation_id, :presence => {:message => "No puede estar en blanco" }

	#validates :room_id, :presence => {:message => "No puede estar en blanco" }

	def disponibilidad
		 ReservationRoom.all.each do |room|
		 	if self.type_of_room = room.type_of_room
		 		errors.add(:type_of_room, "Este cuarto esta reservado")
			end
		 end
	end

  	 
end
