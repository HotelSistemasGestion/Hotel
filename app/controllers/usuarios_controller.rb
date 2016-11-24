class UsuariosController < ApplicationController    
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = User.all    
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = User.new    
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = User.find params[:id]
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = User.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuarios_url, success: 'Creaste un usuario correctamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuarios_url, success: 'Editaste un usuario correctamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, success: 'Eliminaste un usuario correctamenteed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:user).permit(:username,
                                   :email, 
                                   :password, 
                                   :password_confirmation, 
                                   :apellido, 
                                   :numero_ci, 
                                   :direccion, 
                                   :telefono, 
                                   :celular,
                                   :rol_id)
    end
end





