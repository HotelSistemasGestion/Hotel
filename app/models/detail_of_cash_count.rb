class DetailOfCashCount < ActiveRecord::Base
	belongs_to :cash_count
	belongs_to :payment_type
end
