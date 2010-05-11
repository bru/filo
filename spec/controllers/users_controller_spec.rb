require 'spec_helper'

describe UsersController do

  #Delete these examples and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  describe "when signed in" do
    before(:each) do
      @user = Factory(:email_confirmed_user)
      @controller.current_user = @user
    end
    describe "GET 'destroy'" do
      it "should be successful" do
        get 'destroy'
        response.should be_success
      end
    end
  
    describe "DELETE 'destroy'" do
      it "should be successful" do
        post 'destroy', :id => @user.id
        response.should be_redirect
      end
      
      it "should report success" do
        post 'destroy', :id => @user.id
        flash[:notice].should_not be_nil
      end
    end
  end
  
  describe "when signed out" do
    describe "GET 'destroy'" do
      it "should redirect" do
        get 'destroy'
        response.should be_redirect
      end
    end
  end
end
