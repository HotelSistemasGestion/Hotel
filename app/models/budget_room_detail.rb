class BudgetRoomDetail < ActiveRecord::Base
	belongs_to :budget
	belongs_to :type_of_room

	attr_accessor :precio_habitacion,:type_of_room

	validates :cantidad, 
          :presence => {:message => "No puede dejar en blanco Cantidad" },
          :numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}


    validate :hay_disponible

    def hay_disponible
    	result = hay_disponible_ayudante(self.type_of_room_id,1,(Date.today+1).to_s,(Date.today+2).to_s)
    	if result== false
    		errors.add(:type_of_room_id, "No esta Disponible")
    	end
    end

    def hay_disponible_ayudante(type_of_room_id,comfort_id,check_in,check_out)
    #Primero miro si hay alguna habitacion con lo requerido que su estado sea "Libre"
    room= Room.where(["type_of_room_id = ? and state_id = ?", type_of_room_id,1])
    #Si hay,retorno true
    if room.any?
      return true
      #Se acaba la funcion por que ya comprobe que hay una habitacion disponible
    end
    #Si no hay ninguna "Libre",debemos buscar en las reservadas si esta disponible en nuestro rango de fechas.
    #Buscamos las habitaciones reservadas.
    room_ids= Room.where(["type_of_room_id = ? and state_id != ? and state_id != ?", type_of_room_id,1,4]).select("id")
    #Sacamos las reservaciones de habitaciones que ahora estan en estado reservada.
    filter=Reservation.where(room_id:room_ids)
    for i in 0..filter.length-1
      #pregunto si se superponen las fechas
     if !(filter[i].check_in.to_s..filter[i].check_out.to_s).overlaps?(check_in..check_out)
      return true
     end
    end
    #reservation = Reservation.where("check_in > ?",check_in)
    return false
   end
end
