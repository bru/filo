class IphoneController < ApplicationController
  
  layout "iphone"
    
  def index
    if signed_in?
      @knots = current_user.knots
      render :layout => iphone_layout
    else
      store_location
      render :action => "login", :controller => "iphone"
    end
  end
  
  def login
  end

  protected 
  
  def iphone_layout
     request.xhr? ? false : "iphone"
   end  

end
