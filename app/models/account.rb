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

    before_save :change_reservation_state


    accepts_nested_attributes_for :account_details, allow_destroy: true, update_only: true
    accepts_nested_attributes_for :room_account_details, allow_destroy: true , update_only: true

    #Opciones de filtros para reportes
    filterrific(available_filters: [:sorted_by_name])
    #Scope para busqueda por nombre y apellido para reportes
    scope :sorted_by_name,-> state { where('accounts.nombre LIKE ?', "%#{state}%")}
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
        def change_reservation_state
            if !self.reservation_id.nil?
                reservation = Reservation.find(reservation_id)
                reservation.state = "confirmado"
                reservation.save
            end
        end
    
    
end
