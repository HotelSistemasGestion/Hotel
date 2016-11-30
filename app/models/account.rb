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
    filterrific(available_filters: [:sorted_by_name,:sorted_by_state])
    #Scope para busqueda por nombre y apellido para reportes
    scope :sorted_by_name, lambda { |query|
    return nil  if query.blank?
    
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conds = 2
    where(
    terms.map { |term|
      "(LOWER(accounts.nombre) LIKE ? OR LOWER(accounts.apellido) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
    )
    }
    # Scope para busqueda de clientes registrados para reportes
    scope :sorted_by_state, lambda { |sort_option|
    case sort_option.to_s
    when /^clients_all/
        where('accounts.fecha_entrada <= ?', Time.now.strftime("%F"))
    when /^clients_actually/
        where('accounts.fecha_salida >= ?', Time.now.strftime("%F"))
    else
        raise(ArgumentError, "Opcion de ordenamiento invalido: #{ sort_option.inspect }")
    end
    }   
    #Opciones para select de reportes
    def self.options_for_sorted_by_state
    [
      ['Todos los clientes', 'clients_all'],
      ['Actualmente dentro del hotel', 'clients_actually']
    ]
    end
    def self.options_for_sorted_by_identificador
    order('LOWER(identificador_hab)').map { |e| [e.identificador_hab, e.id] }
    end

    private
        #Cuando se elimina una cuenta que ya se facturo pero aun no se pago
        def change_invoice_state
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
