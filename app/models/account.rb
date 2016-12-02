class Account < ActiveRecord::Base
	audited
    belongs_to :client   
    belongs_to :room

    has_many :account_details
    has_many :room_account_details

    validates :nombre, :presence => {:message => "*campo requerido"}

    attr_accessor :client
    attr_accessor :room

    before_destroy :change_invoice_state

    before_save :antes_de_guardar


    accepts_nested_attributes_for :account_details, allow_destroy: true, update_only: true
    accepts_nested_attributes_for :room_account_details, allow_destroy: true , update_only: true

    #Opciones de filtros para reportes
    filterrific(available_filters: [:sorted_by_name, :sorted_by_number])
    #Scope para busqueda por nombre y apellido para reportes
    scope :sorted_by_name,-> state { where('accounts.nombre LIKE ?', "%#{state}%")}
    scope :sorted_by_number,-> state { where('accounts.numero LIKE ?', "%#{state}%")}
    # Scope para busqueda de clientes registrados para reportes

    def self.options_for_sorted_by_identificador
    order('LOWER(identificador_hab)').map { |e| [e.identificador_hab, e.id] }
    end

    private
        #Cuando se elimina una cuenta que ya se facturo pero aun no se pago
        def change_invoice_state
            AccountDetail.destroy_all(account_id: self.id)
            RoomAccountDetail.destroy_all(account_id: self.id)
            factura = Invoice.find_by(account_id: self.id)
            if !factura.nil?
                factura.state = "cancelado"
                factura.save
            end            
        end

        #cuando se registra a partir de una reservación cambia el estado de la reservación
        def antes_de_guardar
            self.subtotal=0
            if self.descuento.nil? then self.descuento = 0 end
            #cambiar el estado de una reservación a confirmado
            if !self.reservation_id.nil?
                reservation = Reservation.find(reservation_id)
                if reservation.state.pendiente?
                    reservation.state = "confirmado"
                    reservation.save
                end
            end
            self.room_account_details.each do |rad|
                self.subtotal= self.subtotal + rad.subtotal
            end
            self.account_details.each do |ad|
                self.subtotal= self.subtotal + ad.subtotal
            end
            self.total= self.subtotal - (self.subtotal * self.descuento / 100)
            self.iva= self.total / 11
        end
    
    
end
