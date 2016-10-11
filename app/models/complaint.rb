class Complaint < ActiveRecord::Base
	belongs_to :room
	belongs_to :service
	validates :room_id, :description, :service_id, presence: true
	validates :description, length: { maximum: 500 }
end
