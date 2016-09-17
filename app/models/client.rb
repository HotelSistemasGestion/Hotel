class Client < ActiveRecord::Base
    has_many :invoices
    has_many :accounts
    validates :nombre, :apellido, :cedula, presence: true
    validates :email, email_format: { message: ': ingrese una direccion de email valida' }
end
