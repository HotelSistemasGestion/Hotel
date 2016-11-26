class Invoice < ActiveRecord::Base
	audited
	extend Enumerize
	enumerize :state, in: %w(pagado pendiente cancelado), predicates: true
    belongs_to :client
    belongs_to :detail_of_cash_movement


    validates :numero, uniqueness: true, 
    				   presence: { message: "Numero de factura no puede ser nulo" }

    has_many :invoice_details, :dependent => :destroy

    attr_accessor :client

    accepts_nested_attributes_for :invoice_details, allow_destroy: true , update_only: true
end
