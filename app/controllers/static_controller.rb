class StaticController < ApplicationController
  def home
    redirect_to knots_path if signed_in?
  end

  def about
  end

  def contacts
  end

end
