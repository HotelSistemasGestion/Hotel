class ReservationRequest < ActiveRecord::Base
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
  filterrific(available_filters: [:sorted_by_state,:created_at_gte,:created_at_lt,:sorted_by,:sorted_by_apellido])
  #scopes para reporte
  scope :sorted_by, lambda { |nombre| where('reservation_requests.nombre = ?', nombre)}
  scope :sorted_by_apellido, lambda { |apellido| where('reservation_requests.apellido = ?', apellido)}
  
  scope :created_at_gte, lambda { |reference_time| where('reservation_requests.check_in >=?', reference_time)}
  scope :created_at_lt, lambda { |reference_time| where('reservation_requests.check_out <= ?', reference_time)}
  #Metodo utilizado por filtros dentro de reportes para quejas	
  scope :sorted_by_state, lambda { |sort_option|
    case sort_option.to_s
    when /^todos/
        @reservation_requests = Budget.joins(:reservation_request)
    when /^pendientes/
        Budget.joins(:reservation_request).where('budgets.reservation_request_id = 0')
    when /^respondidos/
        Budget.joins(:reservation_request).where('budgets.reservation_request_id = 0')
    else
        raise(ArgumentError, "Opcion de ordenamiento invalido: #{ sort_option.inspect }")
    end	
    } 

  def self.options_for_sorted_by_state
    [
      ['Todos', 'todos'],
      ['Pendientes', 'pendientes'],
      ['Respondidos', 'respondidos'],
    ]
   end
end
