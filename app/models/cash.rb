class Cash < ActiveRecord::Base
	has_many :opening_cash

	validates :descripcion, presence: { message: " No puede dejar en blanco "}, length: {maximum: 20}
	validates :estado, length: {maximum: 7}
end
