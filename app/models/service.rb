class Service < ActiveRecord::Base
	audited
	has_many :account_details
	has_many :invoice_details
	has_many :budget_details


	#atributos para filtros de reporte
  	filterrific(available_filters: [:sorted_by_service,:sorted_by_price_lw,:sorted_by_price_gt])
  	#scopes para reporte
  	scope :sorted_by_service, lambda{ |service_nombre_ids| where(:id => [*service_nombre_ids])}
 	scope :sorted_by_price_lw, lambda { |price| where('services.precio >=?', price)}
    scope :sorted_by_price_gt, lambda { |price| where('services.precio <= ?', price)}
  	#Metodo utilizado por filtros dentro de reportes para quejas
  	def self.options_for_sorted_by_service
    order('LOWER(nombre)').map { |e| [e.nombre, e.id] }
  	end
	
	validates :nombre, presence: true, length: {minimum: 4, :message => "4 caracteres mínimo."}

	validates :descripcion, presence: true, length: {minimum: 6, :message => "6 caracteres mínimo."}

	validates :precio, presence: true, length: {minimum: 4, maximum: 12, :message => "4 dígitos minimo; 12 máximo."}, :numericality => {:only_integer => true, :message => "Solo puede ingresar numeros enteros"}



end
