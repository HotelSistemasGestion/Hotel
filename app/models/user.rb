class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :rol
    
  def has_role?(rol)
    !self.rol.actions.find_by(accion: rol).nil?     
  end

end
