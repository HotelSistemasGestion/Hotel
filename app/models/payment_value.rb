class PaymentValue < ActiveRecord::Base
	has_many :payment_types
end
