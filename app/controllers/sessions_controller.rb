class SessionsController < Clearance::SessionsController

  def create
    @user = ::User.authenticate(params[:session][:email],
                                params[:session][:password])
    if @user.nil?
      if request.xhr?
        render :template => 'iphone/login_error', :layout => false
      else
        format.html
        flash_failure_after_create
        render :template => 'sessions/new', :status => :unauthorized
      end
    else
      if @user.email_confirmed?
        sign_in(@user)
        flash_success_after_create
        redirect_back_or(url_after_create)
      else
        ::ClearanceMailer.deliver_confirmation(@user)
        flash_notice_after_create
        redirect_to(sign_in_url)
      end
    end
  end
  
end