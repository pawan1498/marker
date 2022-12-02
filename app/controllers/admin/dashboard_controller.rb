class Admin::DashboardController < Admin::AdminController
  def index 
    @user = User.all
  end 

  
end
