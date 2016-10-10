class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Custom flash para complaints
  add_flash_types :my_type
  protect_from_forgery with: :exception

  # Metodos necesarios para el bloqueo por IP
  private
  helper_method :is_ip_allowed
	def is_ip_allowed  
    if ip_block.include?(request.remote_ip).to_s
			return true
		else 
			return false
		end
	end
 	# Ips permitidos
 	def ip_block
    %w{
       
        127.0.0.1
        127.0.0.0
        10.0.0.1
        10.0.0.0
        192.168.0.1
        192.168.0.0
        0.0.0.0
        localhost
        
    }
	end
  
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
end
