class Admin::DashboardController < Admin::AdminController
  def index 
  end 
  
  def user
    if params[:name].present?
      @user = User.where("email LIKE ? ",  params[:name])
    else
      @user = User.all.order(created_at: :asc)
    end 
  end 

  def toggle_user
    user = User.find(params[:user_id])
    if current_user.admin?
      if user.active
        user.deactivate_account!
      else
        user.active_account!
      end 
    end
    redirect_to  user_admin_dashboard_index_path
  end

  

  
end
