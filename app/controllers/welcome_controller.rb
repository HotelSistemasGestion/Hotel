class WelcomeController < ApplicationController
  def index
  	@reservation_request = ReservationRequest.new
  end
end
