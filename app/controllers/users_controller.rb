class UsersController < Clearance::UsersController
  before_filter :authenticate, :only => [:destroy]
  
  def destroy
    if request.delete?
      user = User.find(params[:id])
      unless current_user == user
        flash[:error] = I18n.t('controllers.users.destroy.unauthorized')
        redirect_to root_path and return
      end
      sign_out
      user.destroy
      flash[:notice] = I18n.t('controllers.users.destroy.success')
      redirect_to root_path and return
    end
  end

end
