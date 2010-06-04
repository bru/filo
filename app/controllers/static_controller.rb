class StaticController < ApplicationController
  def home
    if signed_in?
      redirect_to knots_path 
    elsif is_iphone_request?
      redirect_to iphone_path 
    end
  end

  def about
  end

  def contacts
  end

end
