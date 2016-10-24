class Employee < ActiveRecord::Base
  belongs_to :types_of_employee
  delegate :tipo, to: :types_of_employee, prefix: true, allow_nil: true
  has_many :opening_cash
  
  def full_name
  	"#{self.nombre} #{self.apellido}"
  end
end
