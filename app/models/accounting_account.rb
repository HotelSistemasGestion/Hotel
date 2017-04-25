class AccountingAccount < ActiveRecord::Base
	audited
	has_many :account_x_plans
	has_many :account_x_entries
	has_many :account_x_auto_entry_dets
	has_many :account_x_plans,:dependent => :destroy
	attr_accessor :plan
	attr_accessor :eje1

	validates :grupo ,:presence => {:message => "No puede dejar en blanco el Grupo" },
			  :numericality  => { :more_than_or_equal_to => 1, :message => "Solo puede ingresar numeros enteros"}
	
	validates :nombre,:presence => {:message => "No puede dejar en blanco el Nombre" },
			  length: {minimum: 5, maximum: 30}
	
	validate :imputable
	
	validates :cuenta,:presence => {:message => "No puede dejar en blanco el Cuenta" },
			  :numericality  => { :more_than_or_equal_to => 1, :message => "Solo puede ingresar numeros enteros"}

	

end
