class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles, dependent: :destroy
  has_many :rols, through: :user_roles, dependent: :destroy
  
  def has_role?(rol)
    !self.rols.find_by(role: rol).nil?     
  end
end
