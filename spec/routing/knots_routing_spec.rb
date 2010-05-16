require 'spec_helper'

describe KnotsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/knots" }.should route_to(:controller => "knots", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/knots/new" }.should route_to(:controller => "knots", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/knots/1" }.should route_to(:controller => "knots", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/knots/1/edit" }.should route_to(:controller => "knots", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/knots" }.should route_to(:controller => "knots", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/knots/1" }.should route_to(:controller => "knots", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/knots/1" }.should route_to(:controller => "knots", :action => "destroy", :id => "1") 
    end
    
    it "recognizes and generates #skip" do
      { :get => "/knots/1/skip" }.should route_to(:controller => "knots", :action => "skip", :id => "1") 
    end
    
    it "recognizes and generates #read" do
      { :get => "/knots/1/read" }.should route_to(:controller => "knots", :action => "read", :id => "1") 
    end
    
    it "recognizes and generates #replay" do
      { :get => "/knots/1/replay" }.should route_to(:controller => "knots", :action => "replay", :id => "1") 
    end
    
    it "recognizes and generates #trash" do
      { :get => "/knots/1/trash" }.should route_to(:controller => "knots", :action => "trash", :id => "1") 
    end
  end
end
