class Cleaning < ActiveRecord::Base
  belongs_to :cleaning_room
  belongs_to :room

  belongs_to :employee
  validates :end, :presence => {:message => "Ingrese un email"}
  validates :start, :presence => {:message => "Ingrese un email"}
  delegate :identificador, to: :room, prefix: true, allow_nil: true
  #validate  :validacion_fecha  #
	
    #def validacion_fecha
	#  if end < start
  	#    errors.add(:start, "no puede ser menor al check_in")	
    #  end
    #end
  filterrific(available_filters: [:sorted_by_employee,:sorted_by_identificador,:start,:end])
  scope :sorted_by_employee, lambda{ |employee_ids|where(:employee_id => [*employee_ids])}
  scope :sorted_by_identificador, lambda{ |room_ids|where(:room_id => [*room_ids])}
	scope :start, lambda { |reference_time| where('cleanings.start >=?', reference_time)}
  scope :end, lambda { |reference_time| where('cleanings.end <= ?', reference_time)}



end
