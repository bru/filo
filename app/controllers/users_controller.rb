class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:destroy, :edit, :update]
  before_filter :find_user, :only => [:destroy, :edit, :update, :show]
  before_filter :require_owner, :only => [:destroy, :edit, :update]
  
  def edit
  end
  
  def update
    params[:user].delete(:password) && params[:user].delete(:password_confirmation) if params[:user][:password].blank?
    logger.warn "Updating user with:\n#{params[:user].inspect}"
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.t('controllers.users.update.success')
      redirect_to knots_path
    else
      flash[:alert] = I18n.t('controllers.users.update.failure')
      render :action => "edit"
    end
  end
  
  def show
    unless @user.is_public? or is_owner?
      flash[:alert] = "The user you tried to access does not have a public profile"
      redirect_to knots_path
    end
  end
  
  class NotOwner < StandardError; end
  
  protected
  
  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    deny_action(I18n.t("controllers.users.find_user.not_found"))
  end
  
  def is_owner?
    @user == current_user
  end
  
  def require_owner
    raise NotOwner unless is_owner?
  rescue NotOwner
    deny_action(I18n.t("controllers.users.find_user.unauthorized"))
  end

end
