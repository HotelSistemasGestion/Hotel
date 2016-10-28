class WelcomeController < ApplicationController
  def index
  	@reservation_request = ReservationRequest.new
  	@complaint = Complaint.new
  	
  end
  	

end
