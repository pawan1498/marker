class ApplicationController < ActionController::Base
  # before_action :get_current_user 
  def after_sign_in_path_for(resource)
    if current_user.admin
      admin_dashboard_index_path
    else 
      root_path
    end 
  end
end
