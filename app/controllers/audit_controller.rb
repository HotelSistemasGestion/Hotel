class AuditController < ApplicationController  
  before_action :authenticate_user!  
  load_and_authorize_resource

  def index
    @audited_tables = Audit.all    
    @filterrific = initialize_filterrific(
    Audit,
    params[:filterrific],
    select_options: {
        sorted_by_tabla: Audit.options_for_sorted_by_tabla,
        sorted_by_usuario: User.options_for_sorted_by_usuario
      },
     persistence_id: false
    ) or return

    @audited_tables = @filterrific.find.page(params[:page]).paginate(:per_page => 10, :page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @audited_table = Audited::Audit.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end