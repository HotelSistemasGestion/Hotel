class PaymentType < ActiveRecord::Base
	belongs_to :detail_of_cash_movement
	
	has_many :detail_of_cash_counts
	
end
