class Employee < ActiveRecord::Base
  audited
  belongs_to :types_of_employee
  delegate :tipo, to: :types_of_employee, prefix: true, allow_nil: true
  has_many :opening_cash
  #validates_email_format_of :correo, :message => 'is not looking good'
  #paginates_per 2 
  def full_name
  	"#{self.nombre} #{self.apellido}"
  end
  
  filterrific(available_filters: [:sorted_by_types_of_employee])
  #scopes para reporte
  scope :sorted_by_types_of_employee, lambda{ |room_types_of_employee_ids|where(:types_of_employee => [*room_types_of_employee_ids])}
  

  def self.options_for_sorted_by_employee
    joins(:types_of_employee).where('types_of_employees.tipo = ?', "limpiadora").map { |e| [e.nombre, e.id] }
  end
end
