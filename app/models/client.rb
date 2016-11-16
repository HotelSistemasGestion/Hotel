class Client < ActiveRecord::Base
	audited
    has_many :invoices
    has_many :accounts
    has_many :cash_movement
    validates :nombre, :apellido, :cedula, :ruc, presence: true
    validates :email, email_format: { message: ': ingrese una direccion de email valida' }

    def name
  		"#{self.nombre} #{self.apellido}"
	end
end