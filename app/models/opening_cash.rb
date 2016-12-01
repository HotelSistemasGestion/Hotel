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

    filterrific(available_filters: [:sorted_by_employee,:sorted_by_cash,:created_at_gte,:created_at_lt])
    scope :sorted_by_cash,->cash {joins(:cash).where('cashes.descripcion LIKE ?',"%#{cash}%")}
    scope :sorted_by_employee,->employee {joins(:employee).where('employees.nombre LIKE ?',"%#{employee}%")}
    scope :created_at_gte, lambda { |reference_time| where('opening_cashes.fecha_apertura >=?', reference_time)}
    scope :created_at_lt, lambda { |reference_time| where('opening_cashes.fecha_apertura <= ?', reference_time)}
    
end
