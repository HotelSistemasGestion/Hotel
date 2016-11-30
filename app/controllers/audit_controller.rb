class AuditController < ApplicationController
  before_action :authenticate_user!  

  def index
  	@audited_tables = Audit.all    
    @filterrific = initialize_filterrific(
    Audit,
    params[:filterrific],
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
