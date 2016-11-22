class DetailOfCashMovement < ActiveRecord::Base
	belongs_to :cash_movement
	
	has_many :invoices
	
	validates :sub_monto, presence: true, length: {minimum: 4, maximum: 12, :message => "4 dígitos minimo; 12 máximo."}, :numericality => {:only_integer => true, :message => "Solo puede ingresar numeros enteros"}	 
	validates :cash_movement_id, presence: true
	validates :invoice_id, presence: true
end
 