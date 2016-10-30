class InvoiceDetail < ActiveRecord::Base

	belongs_to :services
	belongs_to :invoices

	attr_accessor :service,:ayudante

end
