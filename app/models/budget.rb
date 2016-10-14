class Budget < ActiveRecord::Base
	belongs_to :reservation_request

	has_many :budget_details, :dependent => :destroy

	accepts_nested_attributes_for :budget_details, allow_destroy: true , update_only: true

	
end
