class Invoice < ActiveRecord::Base
	audited
	extend Enumerize
	enumerize :state, in: %w(pagado pendiente cancelado), predicates: true
    belongs_to :client
    belongs_to :detail_of_cash_movement
    after_create :comprobar_cuenta


    validates :numero, uniqueness: true, 
    				   presence: { message: "Numero de factura no puede ser nulo" }

    has_many :invoice_details, :dependent => :destroy

    attr_accessor :client

    accepts_nested_attributes_for :invoice_details, allow_destroy: true , update_only: true

    

    private

        def comprobar_cuenta
            if !account_id.nil?
                Account.find(account_id).account_details.each do |account_detail|
                    InvoiceDetail.create!(invoice_id: self.id, 
                                         service_id: account_detail.service_id,
                                         cantidad: account_detail.cantidad,
                                         precio: account_detail.precio,
                                         subtotal: account_detail.subtotal)
                end                                           
            end            
        end



end
