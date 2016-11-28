class AuditController < ApplicationController
  before_action :authenticate_user!  
  def index
  	@audited_tables = Audited::Audit.all
  end
end
