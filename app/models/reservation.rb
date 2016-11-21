class Reservation < ActiveRecord::Base
	#validates :nombre, :presence => {:message => "no puede estar en blanco"}
	#validates :apellido, :presence => {:message => "no puede estar en blanco"}
	#validates :check_in, :presence => {:message => "en blanco"}
	#validates :check_out, :presence => {:message => "en blanco"}
	#paginates_per 2 #solo puse 2 para probar
	belongs_to :reservation_request
	belongs_to :budget
	has_many :reservation_rooms,:dependent => :destroy

	#
	accepts_nested_attributes_for :reservation_rooms, allow_destroy: true, update_only: true,:reject_if => lambda { |c| c[:type_of_room_id].blank? }
	#
	validate :reserva_fecha
	validate :validacion_fecha

	def reserva_fecha
		 Reservation.all.each do |reservation|
		 	if self.check_in <= reservation.check_out && self.check_out >= reservation.check_in
		 		errors.add(:check_out, "Lo sentimos esta reservada esa fecha")
			end
		 end
	end


	def validacion_fecha
      if !check_in.blank? && check_in < Date.today
        errors.add(:check_in, "menor a fecha actual")
  	  elsif !check_out.blank? && check_out < Date.today
  	    errors.add(:check_out, " menor a fecha actual")
  	  elsif !check_out.blank? && check_out < check_in
  	    errors.add(:check_out, "no puede ser menor al check_in")	
      end
    end
end
