class Cleaning < ActiveRecord::Base
  belongs_to :cleaning_room
  belongs_to :room
  
end
