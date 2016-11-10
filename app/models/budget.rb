class Budget < ActiveRecord::Base
	belongs_to :reservation_request
  belongs_to :comfort

	has_many :budget_service_details,:dependent => :destroy
  has_many :budget_room_details,:dependent => :destroy 
 

	accepts_nested_attributes_for :budget_service_details, allow_destroy: true , update_only: true,:reject_if => lambda { |c| c[:service_id].blank? }
  accepts_nested_attributes_for :budget_room_details, allow_destroy: true , update_only: true,:reject_if => lambda { |c| c[:type_of_room_id].blank? }

	before_save :default_values

	#validates :cantidad_de_habitaciones, 
   #       :presence => {:message => " no puede dejar en blanco " },
    #      :numericality  => { :more_than_or_equal_to => 0, :message => " debe ser mayor a 0"}
  #validates :dias, 
   #       :presence => {:message => " no puede dejar en blanco" },
    #      :numericality  => { :more_than_or_equal_to => 0, :message => " debe ser mayor a 0"}


  def default_values
  	total_services=BudgetServiceDetail.where("budget_id": self.id).sum("subtotal");
  	#precio_habitacion=100000#deberia ser una consulta segun el tipo de habitacion
  	#total_habitacion= (self.dias * self.cantidad_de_habitaciones * precio_habitacion)
    self.total= (total_services)
  end



	
end
