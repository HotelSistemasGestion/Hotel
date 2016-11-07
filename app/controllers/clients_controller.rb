class ClientsController < ApplicationController
  #before_action :authenticate_user!
  #load_and_authorize_resource
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  #autocomplete :client, :cedula, :extra_data => [:email, :direccion, :ruc, :telefono]
  autocomplete :client, :cedula, :display_value => :name, :extra_data => [:nombre, :apellido, :email, :direccion, :ruc, :telefono]
  #autocomplete :client, :cedula, :extra_data => [:ruc , :direccion] do |items|
  #  respond_to do |format|
   # format.json { render :json => @items }
    #end
  #end
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
         format.js { } # Hace un render a create.js.erb
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:nombre, :apellido, :telefono, :email, :direccion, :cedula, :ruc)
    end
end
