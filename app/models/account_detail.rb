class AccountDetail < ActiveRecord::Base

	belongs_to :services
	belongs_to :accounts


	before_save :set_values
	filterrific(available_filters: [:sorted_by])
	scope :sorted_by,-> state { joins(:account).where('accounts.identificador_hab LIKE ?', "%#{state}%")}
	
	
	private

		def set_values
			self.precio = self.subtotal / self.cantidad
			self.servicio = Service.find(self.service_id).nombre
		end

end
