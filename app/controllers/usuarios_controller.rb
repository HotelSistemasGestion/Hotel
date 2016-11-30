class UsuariosController < ApplicationController
  before_action :authenticate_user!    
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  def index
    @usuarios = User.all    
    @filterrific = initialize_filterrific(
    User,
    params[:filterrific],
     persistence_id: false
    ) or return
    @usuarios = @filterrific.find.page(params[:page]).paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
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
        @photo = Photo.new({:user_id =>@usuario.id})
        @photo.save

        if @usuario.rol_id.nil?
          format.html { redirect_to new_rol_path, notice: 'El usuario fue creado, asignele un nuevo rol.' }
        else
          format.html { redirect_to usuarios_url, notice: 'El usuario fue creado exitosamente.' }
          format.json { render :show, status: :created, location: @usuario }
        end

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
   
    #eliminar foto de perfil 
    r = Photo.where("#{:user_id} =?",params[:id])
    #solo eliminar si posee foto de perfil 
    if r.present?
       r.destroy_all
    end

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





