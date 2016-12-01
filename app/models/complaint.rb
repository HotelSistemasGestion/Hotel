class Complaint < ActiveRecord::Base
  audited
	belongs_to :room
	belongs_to :complaint_service
	validates :room_id, :description,:complaint_service_id, presence: true
	validates :description, length: { maximum: 500 }
  after_initialize :init
  filterrific(available_filters: [:sorted_by,:sorted_by_identificador,:created_at_gte,:created_at_lt])

  scope :sorted_by,-> state { joins(:complaint_service).where('complaint_services.description LIKE ?', "%#{state}%")}
  scope :sorted_by_identificador, lambda{ |room_ids|where(:room_id => [*room_ids])}
  scope :created_at_gte, lambda { |reference_time| where('complaints.created_at >=?', reference_time)}
  scope :created_at_lt, lambda { |reference_time| where('complaints.created_at <= ?', reference_time)}
 
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
