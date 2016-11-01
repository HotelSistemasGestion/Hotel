class Service < ActiveRecord::Base

	has_many :account_details
	has_many :invoice_details
	has_many :budget_details

	validates :nombre, presence: true, length: {minimum: 4, :message => "4 caracteres mínimo."}

	validates :descripcion, presence: true, length: {minimum: 6, :message => "6 caracteres mínimo."}

	validates :precio, presence: true, length: {minimum: 4, maximum: 12, :message => "4 dígitos minimo; 12 máximo."}, :numericality => {:only_integer => true, :message => "Solo puede ingresar numeros enteros"}
end
