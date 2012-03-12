Euro2012::Application.routes.draw do

  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  resources :sessions, :only => [:new, :create, :destroy]

  resources :users
  resources :game_groups
  resources :games
  resources :events
  
  resources :pools do
    get 'play', :on => :member

    resources :players
  end

  root :to => 'sessions#new'
end
