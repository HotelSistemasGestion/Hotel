class RoomComfort < ActiveRecord::Base
  belongs_to :room
  belongs_to :comfort
  belongs_to :reservation_room
  delegate :descripcion, to: :comfort, prefix: true, allow_nil: true
   def self.options_for_sorted_by_comfort
    order('LOWER(descripcion)').map { |e| [e.descripcion, e.id] }
  end
end
