class PaymentType < ActiveRecord::Base
	belongs_to :cash_movement
	belongs_to :payment_value

	has_one :check
	validates :payment_value_id, :presence => {:message => " Seleccione un tipo de valor " }
	validates :total, :presence => {:message => " Ingrese el monto " }
end
