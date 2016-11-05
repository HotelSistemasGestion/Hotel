class Complaint < ActiveRecord::Base
	belongs_to :room
	belongs_to :complaint_service
	validates :room_id, :description,:complaint_service_id, presence: true
	validates :description, length: { maximum: 500 }
  after_initialize :init

  def init
      self.state = false if self.state.nil?
  end

  def self.search(search)
  if search
     Complaint.joins(:complaint_service).where 'complaint_services.description LIKE ?',"%#{search}%"
  else
    where (nil)
  end
end

end
