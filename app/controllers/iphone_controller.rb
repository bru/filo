class IphoneController < ApplicationController
  
  layout "iphone"
    
  def index
    if user_signed_in?
      @knots = current_user.knots
      render :layout => iphone_layout
    else
      store_location
      render :template => "/iphone/signin"
    end
  end

  protected 
  
  def iphone_layout
     request.xhr? ? false : "iphone"
   end  

end
