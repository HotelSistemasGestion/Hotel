class OpeningCash < ActiveRecord::Base
	belongs_to :cash
	has_one :closing_cash
	has_one :cash_count 
	has_many :cash_movement
end
