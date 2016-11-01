class BudgetDetail < ActiveRecord::Base
	belongs_to :bundget
	belongs_to :service
	#validates :cantidad, :numericality => { :more_than_or_equal_to => 0 }, :presence => true,:message => "Cantidad debe ser mayor a 0"
	validates :cantidad, 
          :presence => {:message => "No puede dejar en blanco Cantidad" },
          :numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}
	attr_accessor :service,:ayudante

	before_save :default_values

  def default_values
  	my_service=Service.find(self.service_id)
    self.subtotal = (self.cantidad * my_service.precio)
  end
end
