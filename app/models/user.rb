class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def self.options_for_sorted_by_usuario
    order('username').map { |e| [e.username, e.id] }.uniq
  end
    
  audited only: [:username, :apellido, :direccion, :numero_ci, :email, :celular, :telefono]
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  filterrific(available_filters: [:sorted_by])
  
  scope :sorted_by, lambda { |query|
    return nil  if query.blank?    
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e| (e.gsub('*', '%') + '%').gsub(/%+/, '%') }
    num_or_conds = 2
    where(
    terms.map { |term|
      "(LOWER(users.username) LIKE ? OR LOWER(users.apellido) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }

  validates :username, presence: { message: "requerido*" }
  validates_format_of :username, :with => /[a-z]/
  validates :username, :length => { :minimum => 2, :message => '2 caracteres como minimo*' }

  validates :apellido, presence: { message: "requerido*" }
  validates_format_of :apellido, :with => /[a-z]/
  validates :apellido, :length => { :minimum => 2, :message => '2 caracteres como minimo*' }

  validates :numero_ci, presence: { message: "requerido*" }
  validates :numero_ci, :numericality => { :message => "ingrese valor numerico*" }
  validates :numero_ci, :length => { :minimum => 7, :maximum => 8, :message => '7 a 8 caracteres como minimo*' }
  
  validates :email, presence: { message: "requerido*" }  
  
  belongs_to :rol
  

  before_create :convert 


  def has_role?(rol)
    !self.rol.actions.find_by(accion: rol).nil?     
  end

  def rol_name?(rol)
    if self.rol.nombre == rol 
    	return true     
    else
    	return false
    end
  end

  private

    def convert
      self.username = self.username.strip.downcase.capitalize
      self.apellido = self.apellido.strip.downcase.capitalize
      if self.direccion.present?
        self.direccion = self.direccion.strip.downcase.capitalize
      end
    end

end
