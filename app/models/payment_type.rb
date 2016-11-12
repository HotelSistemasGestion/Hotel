class PaymentType < ActiveRecord::Base
	belongs_to :cash_movement
	
	has_many :detail_of_cash_counts
	
end
