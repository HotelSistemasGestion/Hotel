class OpeningCash < ActiveRecord::Base
	belongs_to :cash
	belongs_to :employee	
	
	has_one :closing_cash
	has_one :cash_count 

	has_many :cash_movement

    validates :monto_efectivo, presence: true, length: {minimum: 4, maximum: 12, :message => "4 dígitos minimo; 12 máximo."}, :numericality => {:only_integer => true, :message => "Solo puede ingresar numeros enteros"}
    validates :fecha_apertura, presence: true
    validates :cash_id, presence: true
    validates :employee_id, presence: true
    validates :estado, presence: true
    
    delegate :descripcion, to: :cash, prefix: true, allow_nil: true
    delegate :nombre, :apellido, :type_of_employee_id, to: :employee, prefix: true, allow_nil: true
end
