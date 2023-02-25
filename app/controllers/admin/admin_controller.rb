class Admin::AdminController < ApplicationController
  before_action :admin? 
  layout 'admin'


  def admin?
    if current_user.admin 
      return true
    else 
      redirect_to links_path, alert: "You are not authorised!"
    end 
  end 
end
