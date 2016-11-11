class BudgetRoomDetail < ActiveRecord::Base
	belongs_to :budget
	belongs_to :type_of_room

	attr_accessor :precio_habitacion,:type_of_room

	validates :cantidad, 
          :presence => {:message => "No puede dejar en blanco Cantidad" },
          :numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}
end
