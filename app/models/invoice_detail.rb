class InvoiceDetail < ActiveRecord::Base

	belongs_to :services
	belongs_to :invoices

	attr_accessor :service,:ayudante

	before_save :set_values

	private

		def set_values
			if self.precio.nil? then self.precio = self.subtotal / self.cantidad end
			if self.servicio.nil? then self.servicio = Service.find(self.service_id).nombre end
		end

end
