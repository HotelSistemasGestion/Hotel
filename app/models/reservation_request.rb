class ReservationRequest < ActiveRecord::Base
	audited
	belongs_to :comfort
	has_many :budgets,:dependent => :destroy 
	validates :nombre, :presence => {:message => "No puede estar en blanco"}
	validates :apellido, :presence => {:message => "No puede estar en blanco"}
	validates :email, :presence => {:message => "Ingrese un email"}
	validates :telefono, :presence => {:message => "Ingrese un numero valido"}
	validates :cantidad_de_adultos, :presence => {:message => "Debe registrar almenos un adulto"}, :numericality => {:only_integer => true, :message => "solo se aceptan enteros"}
	###
  	validates :comfort_id, :presence => {:message => "No puede estar en blanco"}
	validates :check_in, :presence => {:message => "No puede estar en blanco"}
	validates :check_out, :presence => {:message => "No puede estar en blanco"}
	
	attr_accessor :date_range

	###
	validate  :validacion_fecha  #
	
	#paginates_per 6 #solo puse 3 para probar

    def validacion_fecha
      if !check_in.blank? && check_in < Date.today
        errors.add(:check_in, "menor a fecha actual")
  	  elsif !check_out.blank? && check_out < Date.today
  	    errors.add(:check_out, " menor a fecha actual")
  	  elsif !check_out.blank? && check_out < check_in
  	    errors.add(:check_out, "no puede ser menor al check_in")	
      end
    end

	#scope :sorted_by, lambda { |nombre|where(:nombre => [*nombre])}
	
  #atributos para filtros de reporte
  filterrific(available_filters: [:sorted_by,:sorted_by_apellido])
  #scopes para reporte
  #scope :sorted_by, lambda { |nombre| where('reservation_requests.nombre = ?', nombre)}
  #scope :sorted_by_apellido, lambda { |apellido| where('reservation_requests.apellido = ?', apellido)}
  scope :sorted_by,-> nombre {where('LOWER(reservation_requests.nombre) LIKE ?', "%#{nombre}%")}
  scope :sorted_by_apellido,-> apellido {where('LOWER(reservation_requests.apellido) LIKE ?', "%#{apellido}%")}
  
  
end
