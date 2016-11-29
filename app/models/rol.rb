class Rol < ActiveRecord::Base
  has_many :users
  has_many :rol_actions
  has_many :actions, through: :rol_actions
  before_create :add_user
  validates :nombre, presence: { message: "requerido*" }
  validates :actions, :length => { :minimum => 1, :message => 'Debe seleccionar al menos 1 accion para este nuevo rol' }
  private
  	def add_user
  		if User.where(rol_id: nil).count > 0
  			self.users.push(User.last)
  		end  		  		
  	end
end
