class AccountPlan < ActiveRecord::Base
	audited
	has_many :accounting_years
	has_many :account_x_plans
	attr_accessor :eje1
	has_many :accounting_years,:dependent => :destroy
	accepts_nested_attributes_for :accounting_years, allow_destroy: true , update_only: true
	 validates :descripcion, 
            :presence => {:message => " No puede dejar en blanco " },
            length: {minimum: 5, maximum: 50, :message => "5 - 50 digitos"}
	 validates :estado, 
            :presence => {:message => " No puede dejar en blanco " },
            length: {minimum: 5, maximum: 10, :message => "5 - 10 digitos"}
	 validates :version, 
            :presence => {:message => " No puede dejar en blanco " },
           :numericality  => { :more_than_or_equal_to => 1, :message => "Cantidad debe ser mayor a 0"}
	

end
