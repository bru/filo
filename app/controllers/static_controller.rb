class StaticController < ApplicationController
  before_filter :redirect_if_iphone
  
  def home
    if signed_in?
      redirect_to knots_path 
    end
  end

  def about
  end

  def contacts
  end
  
  protected
  
  def redirect_if_iphone
    redirect_to iphone_path if is_iphone_request?
  end

end
