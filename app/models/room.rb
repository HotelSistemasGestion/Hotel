class Room < ActiveRecord::Base
  belongs_to :type_of_room
  belongs_to :state
end
