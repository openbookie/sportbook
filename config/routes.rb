Euro2012::Application.routes.draw do

  match 'signin',  :to => 'sessions#new'
  match 'signout', :to => 'sessions#destroy'
  
  match 'about',   :to => 'pages#about'
  match 'home',    :to => 'pages#home'
  
  resources :sessions, :only => [:new, :create, :destroy]


  resources :jobs do
    get 'calc', :on => :collection
  end

  resources :users
  resources :game_groups
  resources :games
  resources :teams
  
  resources :events do
    post 'add_team_to', :on => :member
  end
  
  resources :pools do
    get 'add_player_to', :on => :member
    resources :plays
  end

  root :to => 'pages#home'
end
