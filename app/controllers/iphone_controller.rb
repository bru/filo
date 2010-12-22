class IphoneController < ApplicationController
  layout "iphone"
    
  def index
    respond_to do |format|
      format.iphone do
        if user_signed_in?
          @knots = current_user.knots
          render :layout => iphone_layout
        else
          render :template => "/iphone/signin", :layout => "iphone"
        end
      end
      format.html { redirect_to root_path }
    end
  end

  protected 
  
  def iphone_layout
     request.xhr? ? false : "iphone"
   end  

end
