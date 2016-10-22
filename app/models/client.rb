class Client < ActiveRecord::Base
    has_many :invoices
    has_many :accounts
    validates :nombre, :apellido, :cedula, :ruc, presence: true
    validates :email, email_format: { message: ': ingrese una direccion de email valida' }

    def name
  		"#{self.nombre} #{self.apellido}"
	end
end