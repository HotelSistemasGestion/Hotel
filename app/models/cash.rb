class Cash < ActiveRecord::Base
	audited
	has_many :opening_cash

	validates :descripcion, presence: { message: "la descripcion es requerida"}, length: {maximum: 20}
	validates :estado, length: {maximum: 7}
end
