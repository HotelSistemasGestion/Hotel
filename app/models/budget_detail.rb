class BudgetDetail < ActiveRecord::Base
	belongs_to :bundget
	has_many :services

	attr_accessor :service,:ayudante
end
