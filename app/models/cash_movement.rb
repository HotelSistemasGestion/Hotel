class CashMovement < ActiveRecord::Base
	belongs_to :type_of_cash_movement
	belongs_to :opening_cash
	belongs_to :accounting_entry
	belongs_to :client
	belongs_to :payment_type

	has_many :detail_of_cash_movements, :dependent => :destroy

	delegate :descripcion, to: :type_of_cash_movement, prefix: true, allow_nil: true

	accepts_nested_attributes_for :detail_of_cash_movements, allow_destroy: true , update_only: true

	attr_accessor :client 

end
