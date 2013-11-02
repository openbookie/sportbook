
Sportbook::Application.routes.draw do

  ####################
  # routs for db (using sportdb-admin rails engine)

  puts '[boot] routes.rb - before mount SportDbAdmin::Engine'
  mount SportDbAdmin::Engine, :at => '/db'
  puts '[boot] routes.rb - after mount SportDbAdmin::Engine'


  puts '[boot] routes.rb - before mount WorldDbAdmin::Engine'
  mount WorldDbAdmin::Engine, :at => '/worlddb'
  puts '[boot] routes.rb - after mount WorldDbAdmin::Engine'


  mount About::Server,     :at => '/sys'
  mount DbBrowser::Server, :at => '/browse'

  ## todo: add ActivityDb::Server too


  get 'signin',   :to => 'sessions#new'
  get 'signout',  :to => 'sessions#destroy'

  get 'about',    :to => 'pages#about'
  get 'home',     :to => 'pages#home'
  get 'style',    :to => 'pages#style'     # testpage for styles (css)

  get 'live',          :to => 'live#index'
  get 'live/:game_id', :to => 'live#show', :as => :live_game

  get 'time',             :to => 'time#index'
  get 'time2',            :to => 'time#index2'
  get 'time3',            :to => 'time#index3'   # old action timeline - obsolete remove/delete after cleanup!!
  get 'time4',            :to => 'time#index4'   # old action timeline - obsolete remove/delete after cleanup!!

  get 'ical/:play_id',   :to => 'ical#index'

  resource :session, :only => [:new, :create, :destroy]

  resource :password, :only => [:new, :create, :destroy]

  resources :profiles, :only => [:index, :show]

  resources :plays

  resources :pools do
    get 'add_player_to', :on => :member
    resources :players, :only => [:show, :edit]
  end

  #############
  # routes for admin

  get 'admin',  :to => 'admin/pools#index'
  
  namespace :admin do
    resources :pools

    # add plain text import forms for fixtures n quotes  
    resources :fixtures
    resources :quotes    
    
    get 'bonus',         :to => 'bonus#index'

    ## fix: post required?? double check!!
    get 'bonus/update',  :to => 'bonus#update'
  end

  ##############################
  # routes for admin via module (admin not in url -- todo/fix)
  
  scope :module => 'admin' do

    get 'update',         :to => 'update#index'
    put 'update/update',  :to => 'update#update'

    resources :jobs do
      get 'calc',            :on => :collection
      get 'debug_calc',      :on => :collection
      get 'export',          :on => :collection
      get 'keys',            :on => :collection
      get 'wipe_out_time',   :on => :collection
      get 'wipe_out',        :on => :collection
      get 'wipe_out_points', :on => :collection
    end

    resource :import, :only => [:create]

    resources :users
  end


  ##############################
  # routes for setup

  ## todo: move to admin - why? why not?

  get 'setup',  :to => 'setup/bonus_rounds#index'

  namespace :setup do
    resources :bonus_rounds
  end


  #######################
  # home route
  
  root :to => 'pages#home'
end
