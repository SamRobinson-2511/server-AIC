# mount MiradorRails::Engine, at: MiradorRails::Engine.locales_mount_path

Rails.application.routes.draw do
  # resources :arts, only: [:index, :show]
  #viewers routes
  post '/viewers', to: 'viewers#create'
  patch '/viewers/:id/edit', to: 'viewers#update'
  delete '/viewers/:id/delete', to: 'viewers#destroy'
  get '/viewer_profile', to: 'viewers#profile'
  
  # galleries routes
  get 'galleries', to: 'galleries#index'
  get 'galleries/:id', to: 'galleries#show'
  post 'galleries/new', to: 'galleries#create'
  patch 'gallery/:id/edit', to: 'galleries#update'
  delete 'galleries/:id', to: 'galleries#destroy'

  # visits routes
  get 'visits', to: 'visits#index'
  get 'visits/:id', to: 'visits#show'
  post 'visits/new', to: 'visits#create'
  patch 'visits/:id', to: 'visits#update'

  # Defines the root path route ("/")
  # root "articles#index"

  #login and logout
  # post '/login', to: 'sessions#create', as: 'login'
  # get '/auto_login', to: 'sessions#auto_login'
  
  #register
  # post '/register', to: 'sessions#create'
  post '/register', to: 'viewers#register'
  post '/', to: 'sessions#login'
  get '/session', to: 'sessions#show'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  #viewerprofile
  # get '/viewer_profile/:id', to: 'viewers#show', as: 'viewer_profile'


  #fetch arts 
  get 'arts', to: 'arts#index'
  get 'arts/:id', to: 'arts#show'
  get 'arts/images', to: 'arts#images'
  get 'arts/exhibitions', to: 'arts#exhibitions'
  get 'arts/details', to: 'arts#show'
  # get '/:id/is_on_view', to: 'arts#is_on_view'
  # post '/search_arts', to: 'arts#search_arts'
  



end

