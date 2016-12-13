class AccountingYear < ActiveRecord::Base
	belongs_to :account_plan
	attr_accessor :eje
	attr_accessor :plane
		 validates :anho, 
            :presence => {:message => " No puede dejar en blanco " },
           :numericality  => { :more_than_or_equal_to => 0, :message => "Cantidad debe ser mayor a 0"}

           validates :anho,length: {minimum: 4, maximum: 4, :message => "Ingrese 4 digitos"}


           	validates :estado, 
            :presence => {:message => " No puede dejar en blanco " },
            length: {minimum: 5, maximum: 10, :message => "5 - 10 digitos"}
end
