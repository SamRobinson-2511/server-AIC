Rails.application.routes.draw do
  root 'arts#index'

  get '/welcome', to: 'application#welcome'
  get '/welcome/:name', to: 'application#name'
  get '/viewers', to: 'viewers#index'
  get '/viewers/:id', to: 'viewers#show'
  post '/viewers', to: 'viewers#create'
  patch '/viewers/:id', to: 'viewers#update'
  delete '/viewers/:id', to: 'viewers#destroy'

  resources :arts, only: [:index, :show]

  get 'galleries', to: 'galleries#index'
  get 'galleries/:id', to: 'galleries#show'
  post 'galleries/new', to: 'galleries#create'
  patch 'galleries/:id', to: 'galleries#update'
  delete 'galleries/:id', to: 'galleries#destroy'

  # Defines the root path route ("/")
  # root "articles#index"

  #login and logout
  post '/login', to: 'sessions#create', as: 'login'
  # get '/auto_login', to: 'sessions#auto_login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  #register
  post '/register', to: 'sessions#create'
  post '/register', to: 'viewers#create'

  #viewerprofile
  # get '/viewer_profile/:id', to: 'viewers#show', as: 'viewer_profile'


  #fetch arts 
  get 'arts', to: 'arts#index'
  get 'arts/:id', to: 'arts#show'
  get '/:id/is_on_view', to: 'arts#is_on_view'
  # post '/search_arts', to: 'arts#search_arts'
  



end

