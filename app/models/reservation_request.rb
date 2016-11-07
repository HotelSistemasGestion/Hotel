class ReservationRequest < ActiveRecord::Base
	belongs_to :comfort
	has_many :budgets
	validates :nombre, :presence => {:message => "no puede estar en blanco"}
	validates :apellido, :presence => {:message => "no puede estar en blanco"}
	validates :email, :presence => {:message => "Ingrese un email"}
	validates :telefono, :presence => {:message => "ingrese un numero valido"}, :numericality => {:only_integer => true, :message => "solo se aceptan enteros"}
	validates :cantidad_de_adultos, :presence => {:message => "debe registrar almenos un adulto"}, :numericality => {:only_integer => true, :message => "solo se aceptan enteros"}
	###
	validates :check_in, :presence => {:message => "en blanco"}
	validates :check_out, :presence => {:message => "en blanco"}
	###
	validate  :validacion_fecha  #
	
	paginates_per 6 #solo puse 3 para probar

    def validacion_fecha
      if !check_in.blank? && check_in < Date.today
        errors.add(:check_in, "menor a fecha actual")
  	  elsif !check_out.blank? && check_out < Date.today
  	    errors.add(:check_out, " menor a fecha actual")
  	  elsif !check_out.blank? && check_out < check_in
  	    errors.add(:check_out, "no puede ser menor al check_in")	
      end
    end
	

end
