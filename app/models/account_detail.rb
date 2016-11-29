class AccountDetail < ActiveRecord::Base

	belongs_to :services
	belongs_to :accounts


	before_save :set_precio
	filterrific(available_filters: [:sorted_by])
	scope :sorted_by,-> state { joins(:account).where('accounts.identificador_hab LIKE ?', "%#{state}%")}
	private

		def set_precio
			self.precio = self.subtotal / self.cantidad
		end

end
