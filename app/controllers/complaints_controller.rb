class ComplaintsController < ApplicationController
  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(complaint_params)
    respond_to do |format|
    if @complaint.save 
      format.html { redirect_to welcome_index_path(), my_type: 'Su queja ha sido enviada, sera atendida en la brevedad posible.' }
      format.json { render :show, status: :created, location: @complaint}
    else 
      format.html { render 'welcome/index'}
      format.json { render json: @complaint.errors, status: :unprocessable_entity }
    end
  end
  end

  

  def update
  end

  def edit
  end

  def destroy
  end

  def index
     @complaints = Complaint.all
  end

  def show
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:room_id, :service_id, :description)
    end
end
