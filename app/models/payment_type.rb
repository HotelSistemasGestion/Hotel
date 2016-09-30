class PaymentType < ActiveRecord::Base
	has_many :detail_of_payment_type
	has_many :detail_of_cash_count
end
