Euro2012::Application.routes.draw do
  
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  

  resources :users

  resources :pools do
    get 'play', :on => :member    

    resources :players
  end

  root :to => "sessions#new"    
end
