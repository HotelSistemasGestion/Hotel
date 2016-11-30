class CashMovement < ActiveRecord::Base
	audited
	belongs_to :type_of_cash_movement
	belongs_to :opening_cash
	belongs_to :accounting_entry
	belongs_to :client

	has_many :detail_of_cash_movements, :dependent => :destroy
	has_many :payment_types, :dependent => :destroy

	delegate :descripcion, to: :type_of_cash_movement, prefix: true, allow_nil: true
	delegate :nombre,:apellido, to: :client, prefix: true, allow_nil: true
	 
	accepts_nested_attributes_for :payment_types, allow_destroy: true , update_only: true

	validates :opening_cash_id, presence: true
	validates :client_id, :presence => {:message => " Ingrese un cliente " }
	validates :type_of_cash_movement_id, :presence => {:message => " Seleccione un tipo de movimiento " }
	validates :monto_total, presence: true, length: {maximum: 12, :message => "12 dígitos máximo."}, :numericality => {:only_integer => true, :message => "Solo puede ingresar numeros enteros"}	  

	filterrific(available_filters: [:sorted_by_client,:created_at_gte,:created_at_lt])
	scope :sorted_by_client,-> client { joins(:client).where('clients.nombre LIKE ?', "%#{client}%")}
	scope :created_at_gte, lambda { |reference_time| where('cash_movements.fecha >=?', reference_time)}
  	scope :created_at_lt, lambda { |reference_time| where('cash_movements.fecha <= ?', reference_time)}
	def verificar_valores
		
	end
end
