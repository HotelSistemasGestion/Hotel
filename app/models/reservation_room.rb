class ReservationRoom < ActiveRecord::Base
	belongs_to :reservation

	validates :subtotal, :presence => {:message => "No puede dejar en blanco Cantidad" }, 
	:numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}

	validates :reservation_id, :presence => {:message => "No puede estar en blanco" }

	validates :room_id, :presence => {:message => "No puede estar en blanco" }
  	 
end
