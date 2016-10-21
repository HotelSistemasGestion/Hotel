class ReservationRequest < ActiveRecord::Base
	belongs_to :type_of_room
	has_many :budgets
	validates :nombre, :presence => {:message => "no puede estar en blanco"}
	validates :apellido, :presence => {:message => "no puede estar en blanco"}
	validates :email, :presence => {:message => "Ingrese un email"}
	validates :telefono, :presence => {:message => "ingrese un numero valido"}, :numericality => {:only_integer => true, :message => "solo se aceptan enteros"}
	validates :cantidad_de_adultos, :presence => {:message => "debe registrar almenos un adulto"}, :numericality => {:only_integer => true, :message => "solo se aceptan enteros"}
	validates :check_in, :presence => {:message => "en blanco"}
	validates :check_out, :presence => {:message => "en blanco"}

	paginates_per 5 #solo puse 3 para probar
end
