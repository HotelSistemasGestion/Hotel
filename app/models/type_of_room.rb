class TypeOfRoom < ActiveRecord::Base


   def self.options_for_sorted_by_type
    order('LOWER(tipo)').map { |e| [e.tipo, e.id] }
  end
end
