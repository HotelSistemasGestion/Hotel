class Rol < ActiveRecord::Base
  #Asociaciones
  has_many :users
  has_many :rol_actions
  has_many :actions, through: :rol_actions
  #Callbacks
  before_create :add_user, :convert
  #Validaciones
  validates :nombre, presence: { message: "Asigne un nombre al nuevo rol*" }
  validates :nombre, uniqueness: { message: "Ya existe un rol con este nombre." }
  validates :nombre, :length => { :minimum => 4, :maximum => 15, :message => '4 a 15 caracteres como minimo*' }
  validates :actions, :length => { :minimum => 1, :message => 'Debe seleccionar al menos una accion para este nuevo rol' }
  
  private
  	def add_user
  		if User.where(rol_id: nil).count > 0
  			self.users.push(User.last)
  		end  		  		
  	end

    def convert
      self.nombre = self.nombre.strip.downcase.capitalize
    end

end
