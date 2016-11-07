class Reservation < ActiveRecord::Base
	#validates :nombre, :presence => {:message => "no puede estar en blanco"}
	#validates :apellido, :presence => {:message => "no puede estar en blanco"}
	#validates :check_in, :presence => {:message => "en blanco"}
	#validates :check_out, :presence => {:message => "en blanco"}
	paginates_per 2 #solo puse 2 para probar
end
