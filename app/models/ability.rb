class Ability
  include CanCan::Ability

  def initialize(user)

   user ||= User.new
   if user.rol_name? "Admin"
     can :manage, :all
   elsif user.rol_name? "Recepcionista"
     can :manage, Client
     can :manage, Reservation
     can :manage, ReservationRequest
     can :manage, Room
     can :manage, Service
     can :manage, Invoice
     can :manage, Account
   elsif user.rol_name? "Cajero"
     can :read, CashMovement
     can :create, CashMovement
     can :read, Clients                        
     can :read, Invoices
   elsif user.rol_name? "Supervisor"
     can :read, CashMovement
     can :manage, Cash
     can :manage, OpeningCash
     can :manage, ClosingCash
   elsif user.rol_name? "Auditor"
     can :manage, Audit     
   elsif user.has_role? "Ver Movimiento"     
     can :read, CashMovement
   elsif user.has_role? "Crear Movimiento"
     can :create, CashMovement
     can :read, CashMovement
   elsif user.has_role? "Editar Movimiento"
     can :edit, CashMovement
     can :read, CashMovement
  elsif user.has_role? "Eliminar Movimiento"
     can :destroy, CashMovement
     can :read, CashMovement    
  elsif user.has_role? "Ver Caja"
     can :read, Cash
  elsif user.has_role? "Crear Caja"
     can :create, Cash
     can :read, Cash
  elsif user.has_role? "Editar Caja"
     can :edit, Cash
     can :read, Cash
  elsif user.has_role? "Eliminar Caja"
     can :destroy, Cash
     can :read, Cash
  elsif user.has_role? "Ver Apertura"
     can :read, OpeningCash
  elsif user.has_role? "Crear Apertura"
     can :create, OpeningCash
     can :read, OpeningCash
  elsif user.has_role? "Editar Apertura"
     can :edit, OpeningCash
     can :read, OpeningCash
  elsif user.has_role? "Eliminar Apertura"
     can :destroy, OpeningCash
     can :read, OpeningCash
  elsif user.has_role? "Ver Cierre"
     can :read, ClosingCash
  elsif user.has_role? "Crear Cierre"
     can :create, ClosingCash
     can :read, ClosingCash
  elsif user.has_role? "Editar Cierre"
     can :edit, ClosingCash
     can :read, ClosingCash
  elsif user.has_role? "Eliminar Cierre"
     can :destroy, ClosingCash
     can :read, ClosingCash
  elsif user.has_role? "Ver Arqueo"
     can :read, CashCount
  elsif user.has_role? "Crear Arqueo"
     can :create, CashCount
     can :read, CashCount
  elsif user.has_role? "Editar Arqueo"
     can :edit, CashCount
     can :read, CashCount
  elsif user.has_role? "Eliminar Arqueo"
     can :destroy, CashCount
     can :read, CashCount
  elsif user.has_role? "Ver Pedido"
     can :read, ReservationRequest
  elsif user.has_role? "Crear Pedido"
     can :create, ReservationRequest
     can :read, ReservationRequest
  elsif user.has_role? "Editar Pedido"
     can :edit, ReservationRequest
     can :read, ReservationRequest
  elsif user.has_role? "Eliminar Pedido"
     can :destroy, ReservationRequest
     can :read, ReservationRequest
  elsif user.has_role? "Ver Reservacion"
     can :read, Reservation
  elsif user.has_role? "Crear Reservacion"
     can :create, Reservation
     can :read, Reservation
  elsif user.has_role? "Editar Reservacion"
     can :edit, Reservation
     can :read, Reservation
  elsif user.has_role? "Eliminar Reservacion"
     can :destroy, Reservation
     can :read, Reservation         
  elsif user.has_role? "Ver Factura"
     can :read, Invoice
  elsif user.has_role? "Crear Factura"
     can :create, Invoice
     can :read, Invoice
  elsif user.has_role? "Editar Factura"
     can :edit, Invoice
     can :read, Invoice
  elsif user.has_role? "Eliminar Factura"
     can :destroy, Invoice
     can :read, Invoice
  elsif user.has_role? "Ver Cuenta"
     can :read, Account
  elsif user.has_role? "Crear Cuenta"
     can :create, Account
     can :read, Account
  elsif user.has_role? "Editar Cuenta"
     can :edit, Account
     can :read, Account
  elsif user.has_role? "Eliminar Cuenta"
     can :destroy, Account
     can :read, Account
  elsif user.has_role? "Ver Cliente"
     can :read, Client
  elsif user.has_role? "Crear Cliente"
     can :create, Client
     can :read, Client
  elsif user.has_role? "Editar Cliente"
     can :edit, Client
     can :read, Client
  elsif user.has_role? "Eliminar Cliente"
     can :destroy, Client
     can :read, Client
  elsif user.has_role? "Ver Servicio"
     can :read, Service
  elsif user.has_role? "Crear Servicio"
     can :create, Service
     can :read, Service
  elsif user.has_role? "Editar Servicio"
     can :edit, Service
     can :read, Service
  elsif user.has_role? "Eliminar Servicio"
     can :destroy, Service
     can :read, Service
  elsif user.has_role? "Control de Asientos"
     can :manage, AccountingEntry  
  elsif user.has_role? "Control de Cuentas"
     can :manage, AccountingAccount     
  elsif user.has_role? "Ver habitaciones"
     can :read,Room
  elsif user.has_role? "Crear habitaciones"
     can :create,Room
     can :read,Room
  elsif user.has_role? "Editar habitaciones"
     can :edit,Room
     can :read,Room
  elsif user.has_role? "Inhabilitar habitaciones"
     can :destroy,Room
     can :read,Room
  elsif user.has_role? "Control de Planes de Cuentas"
     can :manage, AccountPlan
  elsif user.has_role? "Ver Movimientos"
     can :manage, Audit
   else
      can :read, Client
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
