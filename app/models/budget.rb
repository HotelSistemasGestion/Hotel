class Budget < ActiveRecord::Base
	belongs_to :reservation_request
  belongs_to :comfort
	has_many :budget_service_details,:dependent => :destroy
  has_many :budget_room_details,:dependent => :destroy 
 
  attr_accessor :date_range

	accepts_nested_attributes_for :budget_service_details, allow_destroy: true , update_only: true,:reject_if => lambda { |c| c[:service_id].blank? }
  accepts_nested_attributes_for :budget_room_details, allow_destroy: true , update_only: true,:reject_if => lambda { |c| c[:type_of_room_id].blank? }

	before_save :default_values

  #alidates_presence_of :check_in,:check_out,:descuento

	validates :check_in, 
            :presence => {:message => " No puede dejar en blanco " }
  validates :check_out, 
            :presence => {:message => " No puede dejar en blanco " }
  validates :descuento, 
            :presence => {:message => " No puede dejar en blanco " }

   validate :validacion_fecha  
  

  def validacion_fecha
    if !check_in.blank? && check_in < Date.today
      errors.add(:check_in, "Menor a fecha actual")
    elsif !check_out.blank? && check_out < Date.today
      errors.add(:check_out, " Menor a fecha actual")
    elsif !check_out.blank? && check_out < check_in
      errors.add(:check_out, "No puede ser menor a la fecha de entrada")  
    end
  end

  def default_values
  	#total_services=BudgetServiceDetail.where("budget_id": self.id).sum("subtotal");
  	#precio_habitacion=100000#deberia ser una consulta segun el tipo de habitacion
  	#total_habitacion= (self.dias * self.cantidad_de_habitaciones * precio_habitacion)
    #self.total= (total_services)
  end



	
end
