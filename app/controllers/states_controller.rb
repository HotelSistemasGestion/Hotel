class StatesController < ApplicationController
  
  def index
    @states = State.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
    @state = State.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)
    respond_to do |format|
      if @state.save
         format.js { } # Hace un render a create.js.erb
      else
        format.html { render :new, notice: 'El estado fue creado correctamente.' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        format.js { }
      else
        format.html { render :edit, notice: 'El estado fue editado correctamente.' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: 'El estado fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:state).permit(:descripcion)
    end
end
