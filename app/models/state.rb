class State < ActiveRecord::Base
	def self.options_for_sorted_by_state
    order('LOWER(descripcion)').map { |e| [e.descripcion, e.id] }
  end
end
