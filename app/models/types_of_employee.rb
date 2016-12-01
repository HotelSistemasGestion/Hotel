class TypesOfEmployee < ActiveRecord::Base
	 def self.options_for_sorted_by_types_of_employee
    order('LOWER(tipo)').map { |e| [e.tipo, e.id] }
  end
end
