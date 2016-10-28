class AccountDetail < ActiveRecord::Base

	belongs_to :services
	belongs_to :accounts

	attr_accessor :service,:ayudante

end
