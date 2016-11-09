class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  autocomplete :complaint_service, :description, :full => true
   # GET /complaints/new
  def new
    @complaint = Complaint.new
  end


  # POST /complaints
  # POST /complaints.json
  def create
    @reservation_request = ReservationRequest.new
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

  
  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(permit_params)
        format.html { redirect_to complaints_path}
        #format.json { render :show, status: :ok, location: @complaint}
      else
        format.html { render :edit }
        #format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /complaints/1/edit
  def edit
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Queja eliminada satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  # GET /complaints
  # GET /complaints.json
  def index
     @complaints = Complaint.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
     @reservation_request = ReservationRequest.new

  end
  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:room_id, :complaint_service_id, :description, :state,:service_description)
    end
    def permit_params
      params.permit(:room_id, :complaint_service_id, :description, :state)
    end
end
