class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def new
  	@photo = Photo.new({:user_id =>current_user.id, :my_file => params[:my_file]})
  	@photo.save
    format.html { redirect_to dashboard_url }
  end
end
