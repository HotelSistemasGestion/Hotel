class ClosingCash < ActiveRecord::Base
	audited
	belongs_to :opening_cash

	validates :opening_cash_id, :presence => {:message => " Seleccione una caja " }
	validates :fecha_cierre, presence: true
	validates :monto_efectivo, presence: true
	validates :monto_cheque, presence: true
	validates :monto_tcredito, presence: true
	validates :monto_tdebito, presence: true
	validates :existente_efe, :presence => {:message => " Ingrese el monto en efectivo " }
	validates :existente_cheque, :presence => {:message => " Ingrese el monto en cheque " }
	validates :existente_tcre, :presence => {:message => " Ingrese el monto en tarjeta credito " }
	validates :existente_tdb, :presence => {:message => " Ingrese el monto en tarjeta debito " }
	filterrific(available_filters: [:created_at_gte,:created_at_lt])
	scope :created_at_gte, lambda { |reference_time| where('closing_cashes.fecha_cierre >=?', reference_time)}
  	scope :created_at_lt, lambda { |reference_time| where('closing_cashes.fecha_cierre <= ?', reference_time)}
end
