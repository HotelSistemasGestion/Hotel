class AuditController < ApplicationController
  before_action :authenticate_user!  

  def index
  	@audited_tables = Audited::Audit.all
  end

  def show
  	@audited_table = Audited::Audit.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
