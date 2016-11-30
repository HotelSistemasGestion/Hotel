class Employee < ActiveRecord::Base
  belongs_to :types_of_employee
  delegate :tipo, to: :types_of_employee, prefix: true, allow_nil: true
  has_many :opening_cash
  validates_email_format_of :correo, :message => 'is not looking good'
  #paginates_per 2 
  def full_name
  	"#{self.nombre} #{self.apellido}"
  end

  def self.options_for_sorted_by_employee
    joins(:types_of_employee).where('types_of_employees.tipo = ?', "limpiadora").map { |e| [e.nombre, e.id] }
  end
end
