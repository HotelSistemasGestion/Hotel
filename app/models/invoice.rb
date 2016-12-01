class Invoice < ActiveRecord::Base
	audited except: [:account_id, :client_id]
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

    
    filterrific(available_filters: [:sorted_by, :sorted_by_number, :sorted_by_state])

    scope :sorted_by, lambda { |nombre| where('invoices.nombre = ?', nombre)}
    scope :sorted_by_number, lambda { |numero| where('invoices.numero = ?', numero)}
    scope :sorted_by_state, lambda { |state| where('invoices.state = ?', state)}

    private

        def comprobar_cuenta
            if !account_id.nil?
                Account.find(account_id).room_account_details.each do |account_detail|
                    InvoiceDetail.create(invoice_id: self.id, 
                                         servicio: Room.find(account_detail.room_id).identificador,
                                         cantidad: (account_detail.subtotal / (Comfort.find(account_detail.comfort_id).precio + TypeOfRoom.find(account_detail.type_of_room_id).precio)),
                                         precio: (Comfort.find(account_detail.comfort_id).precio + TypeOfRoom.find(account_detail.type_of_room_id).precio),
                                         subtotal: account_detail.subtotal)
                end
                Account.find(account_id).account_details.each do |account_detail|
                    InvoiceDetail.create(invoice_id: self.id, 
                                         service_id: account_detail.service_id,
                                         servicio: account_detail.servicio,
                                         cantidad: account_detail.cantidad,
                                         precio: account_detail.precio,
                                         subtotal: account_detail.subtotal)
                end                                           
            end            
        end



end
