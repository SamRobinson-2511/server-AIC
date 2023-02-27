Rails.application.routes.draw do
  

  get '/welcome', to: 'application#welcome'
  get '/welcome/:name', to: 'application#name'
  # get '/viewers', to: 'viewers#index'
  get '/viewers/:id', to: 'viewers#show'
  post '/viewers', to: 'viewers#create'
  patch '/viewers/:id', to: 'viewers#update'
  
  resources :arts, only: [:index, :show]

  get 'galleries', to: 'galleries#index'
  get 'galleries/:id', to: 'galleries#show'
  post 'galleries/new', to: 'galleries#create'
  patch 'gallery/:id/edit', to: 'galleries#update'
  delete 'galleries/:id', to: 'galleries#destroy'

  namespace :admin do
    delete '/viewers/:id', to: 'viewers#destroy'
  end

  # Defines the root path route ("/")
  # root "articles#index"

  #login and logout
  # post '/login', to: 'sessions#create', as: 'login'
  # get '/auto_login', to: 'sessions#auto_login'
  # delete '/logout', to: 'sessions#destroy', as: 'logout'
  #register
  # post '/register', to: 'sessions#create'
  post '/register', to: 'viewers#create'
  post '/login', to: 'viewers#login'

  #viewerprofile
  # get '/viewer_profile/:id', to: 'viewers#show', as: 'viewer_profile'


  #fetch arts 
  get 'arts', to: 'arts#index'
  get 'arts/:id', to: 'arts#show'
  # get '/:id/is_on_view', to: 'arts#is_on_view'
  # post '/search_arts', to: 'arts#search_arts'
  



end

