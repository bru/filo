require 'spec_helper'

describe IphoneController do
  it "should use IphoneController" do
    controller.should be_an_instance_of(IphoneController)
  end

  context "accessing from an iphone" do
    before :each do
      @format = :iphone
    end
    
    context "while signed in" do
      before :each do
        sign_in Factory(:user)
      end
      describe "GET 'index'" do
        it "should be a success" do
          get 'index', :format => @format
          response.should be_success
        end
      end
    end
    context "while signed out" do
      describe "GET 'index'" do
        it "should render iphone/signin template" do
          get 'index', :format => @format
          response.should render_template("iphone/signin")
        end
      end
    end
  end
end
