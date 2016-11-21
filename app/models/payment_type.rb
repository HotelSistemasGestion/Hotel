class PaymentType < ActiveRecord::Base
	belongs_to :cash_movement
	belongs_to :payment_value

	has_one :check
	has_many :detail_of_cash_counts
	
end
