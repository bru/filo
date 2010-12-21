class ApplicationController < ActionController::Base
  
  # set locale
  before_filter :set_locale
  
  helper :all # include all helpers, all the time
  
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  # Respond to iphone requests
  acts_as_iphone_controller
  
  private
  
  def deny_action(flash_message = nil)
    flash[:alert] = flash_message if flash_message
    redirect_to root_path
  end
  
  def set_locale
    I18n.locale = extract_locale_from_params || extract_locale_from_session || extract_locale_from_user
  end
  
  def extract_locale_from_params
    session[:locale] = params[:locale] if params[:locale]
  end
  
  # being a personal service, we're storing the locale in the session. YES, we're breaking the web
  def extract_locale_from_session
    session[:locale] || nil
  end
  
  def extract_locale_from_user
    signed_in? && current_user.language
  end
end
