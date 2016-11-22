class BudgetRoomDetail < ActiveRecord::Base
	belongs_to :budget, inverse_of: :budget_room_details

	attr_accessor :precio_habitacion,:type_of_room,:ayudante

	validates :cantidad, 
          :presence => {:message => "No puede dejar en blanco Cantidad" },
           :numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}



    def hay_disponible
    	myBudget=Budget.where("id = ? ",:budget_id)
    	result = hay_disponible_ayudante(self.cantidad,self.type_of_room_id,1,:check_in,:check_out)
    	if result== false
    		errors.add(:cantidad, "No esta Disponible")
    	end
    end


	 def hay_disponible_ayudante(cantidad,type_of_room_id,comfort_id,check_in,check_out)
	 	puts cantidad
	 	puts type_of_room_id
	 	puts comfort_id
	    count = 0 
	    #Primero miro si hay suficientes habitaciones con lo requerido que su estado sea "Libre"
	    room= Room.where(["type_of_room_id = ? and state_id = ?", type_of_room_id,1])
	    #Si hay,retorno true
	    count=room.count
	    if count >= cantidad
	      return true
	      #Se acaba la funcion por que ya comprobe que hay una habitacion disponible
	    end
	    #Si no hay suficientes "Libres",debemos buscar en las reservadas si esta disponible en nuestro rango de fechas.
	    #Buscamos las habitaciones reservadas.
	    room_ids= Room.where(["type_of_room_id = ? and state_id != ? and state_id != ?", type_of_room_id,1,4]).select("id")
	    #Sacamos las reservaciones de habitaciones que ahora estan en estado reservada.
	    filter=Reservation.where(room_id:room_ids)
	    for i in 0..filter.length-1
		      #pregunto si se superponen las fechas
		     if !(filter[i].check_in.to_s..filter[i].check_out.to_s).overlaps?(check_in..check_out)
		      count=count+1
		     end
		     if count >= cantidad
		      return true
		     end
	    end
	    return false
  	end
end
