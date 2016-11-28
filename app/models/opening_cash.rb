class OpeningCash < ActiveRecord::Base
    audited
	belongs_to :cash
	belongs_to :employee	
	
	has_one :closing_cash
	has_one :cash_count 

	has_many :cash_movement

    validates :monto_efectivo, :presence => {:message => " No puede dejar en blanco " }, length: {minimum: 4, maximum: 12, :message => "4 dígitos minimo; 12 máximo."}
    validates :fecha_apertura, :presence => {:message => " No puede dejar en blanco " }
    validates :cash_id, :presence => {:message => " No puede dejar en blanco " }
    validates :employee_id, :presence => {:message => " No puede dejar en blanco " }
    validates :estado, presence: true
    
    delegate :descripcion, to: :cash, prefix: true, allow_nil: true
    delegate :nombre, :apellido, :type_of_employee_id, to: :employee, prefix: true, allow_nil: true
end
