Filo::Application.routes.draw do |map|
  
  devise_for :users
  map.resources :users

  map.iphone '/i', :controller => "iphone", :action => "index"
  
  map.addknot "/a", :controller => "knots", :action => "create", :remote => true  
  map.resources :knots, :member => { :skip => :get, :replay => :get, :trash => :get, :read => :get }


  map.root :controller => "static", :action => "home"

  Translate::Routes.translation_ui(map) if RAILS_ENV == "development"

end
