class ClosingCash < ActiveRecord::Base
	audited
	belongs_to :opening_cash
end
