class RoomAccountDetail < ActiveRecord::Base
	belongs_to :account
	belongs_to :room
end
