class Service < ActiveRecord::Base
	validates :nombre, :descripcion, :precio, presence: true	
end
