class Cash < ActiveRecord::Base
	audited
	has_many :opening_cash

	validates :descripcion, presence: { message: " No puede dejar en blanco "}, length: {maximum: 20}
	validates :estado, length: {maximum: 7}

	def self.options_for_sorted_by_cash
    order('LOWER(descripcion)').map { |e| [e.descripcion, e.id] }
  	end
end
