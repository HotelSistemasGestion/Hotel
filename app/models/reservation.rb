class Reservation < ActiveRecord::Base
	extend Enumerize
	#validates :nombre, :presence => {:message => "no puede estar en blanco"}
	#validates :apellido, :presence => {:message => "no puede estar en blanco"}
	#validates :check_in, :presence => {:message => "en blanco"}
	#validates :check_out, :presence => {:message => "en blanco"}
	#paginates_per 2 #solo puse 2 para probar
	
	audited

	belongs_to :reservation_request
	belongs_to :budget
	has_many :reservation_rooms,:dependent => :destroy

	#
	accepts_nested_attributes_for :reservation_rooms, allow_destroy: true, update_only: true,:reject_if => lambda { |c| c[:room_id].blank? }
	#
	validates :nombre, :presence => {:message => "No puede estar en blanco" }
	validates :apellido, :presence => {:message => "No puede estar en blanco" }
	validates :telefono, :presence => {:message => "No puede estar en blanco" }

	enumerize :state, in: %w(confirmado pendiente), predicates: true
	
	filterrific(available_filters: [:sorted_by, :sorted_by_apellido, :sorted_by_estado])

	#scope :sorted_by, lambda { |nombre|where(:nombre => [*nombre])}

	scope :sorted_by,-> nombre {where('LOWER(reservations.nombre) LIKE ?', "%#{nombre}%")}
	scope :sorted_by_apellido,-> apellido {where('LOWER(reservations.apellido) LIKE ?', "%#{apellido}%")}
	scope :sorted_by_estado, lambda { |estado|where(:state => [*estado])}

	def self.options_for_sorted_by_estado
    	order('state').map { |e| [e.state] }.uniq
  	end
	#validate :validacion_fecha

	#def reserva_fecha
		 #Reservation.all.each do |reservation|
		 	#if self.check_in <= reservation.check_out && self.check_out >= reservation.check_in
		 		#errors.add(:check_out, "Lo sentimos esta reservada esa fecha")
			#end
		 #end
	#end


	#def validacion_fecha
      #if !check_in.blank? && check_in < Date.today
        #errors.add(:check_in, "menor a fecha actual")
  	  #elsif !check_out.blank? && check_out < Date.today
  	    #errors.add(:check_out, " menor a fecha actual")
  	  #elsif !check_out.blank? && check_out < check_in
  	    #errors.add(:check_out, "no puede ser menor al check_in")	
      #end
    #end

    before_save :set_state

    private

	    def set_state
	    	if self.state.nil?
	    		self.state="pendiente"
	    	end
		end
end
