class Cleaning < ActiveRecord::Base
  belongs_to :cleaning_room
  belongs_to :room
  validates :end, :presence => {:message => "Ingrese un email"}
  validates :start, :presence => {:message => "Ingrese un email"}
  #validate  :validacion_fecha  #
	
    #def validacion_fecha
	#  if end < start
  	#    errors.add(:start, "no puede ser menor al check_in")	
    #  end
    #end
	
end
