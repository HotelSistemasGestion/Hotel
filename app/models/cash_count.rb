class CashCount < ActiveRecord::Base
	belongs_to :opening_cash
	has_many :detail_of_cash_count
end
