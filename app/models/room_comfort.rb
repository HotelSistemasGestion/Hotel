class RoomComfort < ActiveRecord::Base
  belongs_to :room
  belongs_to :comfort
end
