class ReservationRoom < ActiveRecord::Base
	belongs_to :reservation
	
	belongs_to :budget
	belongs_to :type_of_room
  belongs_to :room
	belongs_to :comfort

	#validates :subtotal, :presence => {:message => "No puede dejar en blanco Cantidad" }, 
	#:numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}
	#validates :reservation_id, :presence => {:message => "No puede estar en blanco" }
	
	validates :room_id, :presence => {:message => "No puede estar en blanco" }
	validates :type_of_room_id, :presence => {:message => "No puede estar en blanco" }
	validates :comfort_id, :presence => {:message => "No puede estar en blanco" }
	validates :check_in, :presence => {:message => "No puede estar en blanco" }
	validates :check_out, :presence => {:message => "No puede estar en blanco" }

	validate :hay_disponible
  validate :validacion_fecha  
  

    def validacion_fecha
      if !check_in.blank? && check_in < Date.today
        errors.add(:check_in, "Menor a fecha actual")
      elsif !check_out.blank? && check_out < Date.today
        errors.add(:check_out, " Menor a fecha actual")
      elsif !check_out.blank? && check_out < check_in
        errors.add(:check_out, "No puede ser menor al check_in")  
      end
    end


	def hay_disponible
    room_id = self.room_id
    check_in = self.check_in
    check_out = self.check_out

    @result
    count = 0 
    #Primero miro si esa habitacion su estado sea "Libre"
    room= Room.where(["id = ? and state_id = ?",room_id,1])
    #Si hay,retorno true
    if room.any?
      #Se acaba la funcion por que ya comprobe que hay una habitacion disponible
      return true
    end
    #Si no hay suficientes "Libre",debemos buscar en las reservadas si esta disponible en nuestro rango de fechas.
    #Buscamos las habitaciones reservadas.
    ##room_ids= Room.where(["room_id = ? and state_id != ? and state_id != ?",room_id,1,4]).select("id")
    #Buscamos esa habitacion entre las reservaciones,y vemos si tenemos esa fecha libre
    filter=ReservationRoom.where(room_id:room_id)
    for i in 0..filter.length-1
      #pregunto si se superponen las fechas
     if !(filter[i].check_in.to_s..filter[i].check_out.to_s).overlaps?(check_in.to_date.to_s..check_out.to_date.to_s)
      return true
     end
    end
    errors.add(:room_id, "No esta Disponible")
    return false
  end


   filterrific(available_filters: [:sorted_by_state,:created_at_gte,:created_at_lt])

   scope :created_at_gte, lambda { |reference_time| where('reservation_rooms.check_in >=?', reference_time)}
  scope :created_at_lt, lambda { |reference_time| where('reservation_rooms.check_out <= ?', reference_time)}
  #Metodo utilizado por filtros dentro de reportes para quejas  
  scope :sorted_by_state, lambda { |sort_option|
    case sort_option.to_s
    when /^todos/
        @reservation_rooms = ReservationRoom.joins(:reservation)
    when /^pendientes/
        ReservationRoom.joins(:reservation).where('reservations.state = ?','pendiente')
    when /^confirmados/
        ReservationRoom.joins(:reservation).where('reservations.state = ?','confirmado')
    else
        raise(ArgumentError, "Opcion de ordenamiento invalido: #{ sort_option.inspect }")
    end 
    } 

  def self.options_for_sorted_by_state
    [
      ['Todos', 'todos'],
      ['Pendientes', 'pendientes'],
      ['Confirmados', 'confirmados'],
    ]
   end
  	 
end
