class Account < ActiveRecord::Base
	audited
    belongs_to :client   
    belongs_to :room


    has_many :account_details
    has_many :room_account_details

    validates :fecha_entrada, presence: true

    attr_accessor :client
    attr_accessor :room

    before_destroy :change_invoice_state

    accepts_nested_attributes_for :account_details, allow_destroy: true , update_only: true
    accepts_nested_attributes_for :room_account_details, allow_destroy: true , update_only: true

    private
        #Cuando se elimina una cuenta que ya se facturo pero aun no se pago
        def change_invoice_state
            factura = Invoice.find_by(account_id: self.id)
            if !factura.nil?
                factura.state = "cancelado"
                factura.save
            end            
        end

end
