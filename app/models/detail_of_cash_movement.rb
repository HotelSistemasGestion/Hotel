class DetailOfCashMovement < ActiveRecord::Base
	belongs_to :cash_movement
	
	has_many :invoices
	
	attr_accessor :invoice,:ayudante	 

end
 