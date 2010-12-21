Filo::Application.routes.draw do
  devise_for :users
  resources :users

  match '/i' => "iphone#index", :as => :iphone
  match "/a" => "knots#create", :as => :addknot, :defaults => { :remote => true }
  
  resources :knots do
    member do
      get 'skip'
      get 'replay'
      get 'trash'
      get 'read'
    end
  end

  root :to => "static#home"

end
