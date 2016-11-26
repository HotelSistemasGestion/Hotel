class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_roles, dependent: :destroy
  has_many :rols, through: :user_roles, dependent: :destroy
  #agregar imagenes por usuario
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos ,:allow_destroy => true, update_only: true
  #######################
  def has_role?(rol)
    !self.rols.find_by(role: rol).nil?     
  end
end
