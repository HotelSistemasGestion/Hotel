class RoomComfort < ActiveRecord::Base
  belongs_to :room
  belongs_to :comfort
  delegate :descripcion, to: :comfort, prefix: true, allow_nil: true
end
