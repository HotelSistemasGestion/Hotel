class Comfort < ActiveRecord::Base
	has_many :reservation_requests
	has_many :budgets
	 belongs_to :room
end
