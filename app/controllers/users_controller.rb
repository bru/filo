class UsersController < Clearance::UsersController
  before_filter :authenticate, :only => [:destroy, :edit, :update]
  before_filter :find_user, :only => [:destroy, :edit, :update]
  
  def destroy
    if request.delete?
      sign_out
      @user.destroy
      flash[:notice] = I18n.t('controllers.users.destroy.success')
      redirect_to root_path and return
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.t('controllers.users.update.success')
      redirect_to knots_path
    else
      flash[:alert] = I18n.t('controllers.users.update.failure')
      render :action => "edit"
    end
  end
  
  class NotOwner < StandardError; end
  
  protected
  
  def find_user
    @user = User.find(params[:id])
    raise NotOwner unless @user == current_user
  rescue ActiveRecord::RecordNotFound
    deny_action(I18n.t("controllers.users.find_user.not_found"))
  rescue NotOwner
    deny_action(I18n.t("controllers.users.find_user.unauthorized"))
  end

end
