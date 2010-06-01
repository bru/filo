class PasswordsController < Clearance::PasswordsController
  before_filter :forbid_non_existent_user, :only => [:edit, :update]  
  protected 
  
  def identify_user
    user = ::User.find(params[:user_id])
    params[:user_id] = user.id if user
  end
  
  def forbid_non_existent_user
    identify_user
    super
  end
    
end
