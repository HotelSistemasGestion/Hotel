class CashMovement < ActiveRecord::Base
	belongs_to :type_of_cash_movement
	belongs_to :opening_cash
	belongs_to :accounting_entry
	belongs_to :client

	has_many :detail_of_cash_movements, :dependent => :destroy
	has_many :payment_types, :dependent => :destroy

	delegate :descripcion, to: :type_of_cash_movement, prefix: true, allow_nil: true
	delegate :nombre,:apellido, to: :client, prefix: true, allow_nil: true
	 
	accepts_nested_attributes_for :payment_types, allow_destroy: true , update_only: true

	validates :opening_cash_id, presence: true
	validates :client_id, presence: true
	validates :type_of_cash_movement_id, presence: true
	validates :monto_total, presence: true, length: {minimum: 4, maximum: 12, :message => "4 dígitos minimo; 12 máximo."}, :numericality => {:only_integer => true, :message => "Solo puede ingresar numeros enteros"}	  
end
