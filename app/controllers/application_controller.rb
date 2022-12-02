class ApplicationController < ActionController::Base
  # before_action :get_current_user 
  def after_sign_in_path_for(resource)
    admin_dashboard_index_path
  end
end
