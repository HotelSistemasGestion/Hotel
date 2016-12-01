class Comfort < ActiveRecord::Base
	has_many :reservation_requests
	has_many :budgets
	 belongs_to :room
  def self.options_for_sorted_by_comfort
    order('LOWER(descripcion)').map { |e| [e.descripcion, e.id] }
  end
end
