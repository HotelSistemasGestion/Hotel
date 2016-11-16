class AuditController < ApplicationController
  def index
  	@audited_tables = Audited::Audit.all
  end
end
