class Admin::DashboardController < Admin::AdminController
  def index 
  end 
  
  def user
    @user = User.all
  end 
  
end
