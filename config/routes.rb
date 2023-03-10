# mount MiradorRails::Engine, at: MiradorRails::Engine.locales_mount_path

Rails.application.routes.draw do
  resources :viewers, only: [:index, :show]
  resources :galleries, only: [:index, :show]
  resources :arts, only: [:index, :show]

  #viewers routes
  post 'viewers', to: 'viewers#create'
  patch 'viewers/:id/edit', to: 'viewers#update'
  # delete 'viewers/:id/delete', to: 'viewers#destroy'
  get 'viewer_profile', to: 'viewers#profile'
  get 'viewers', to: 'viewers#index'
  get 'me', to: 'viewers#show'
  
  # galleries routes
  get 'galleries', to: 'galleries#index'
  get 'galleries/:id', to: 'galleries#show'
  get 'galleries/:id/arts', to: 'galleries#arts'
  post 'galleries', to: 'galleries#create'
  post 'galleries/:id/add_art', to: 'galleries#add_art'
  patch 'galleries/:id/edit', to: 'galleries#update'
  post 'galleries/search', to: 'galleries#search'
  delete 'galleries/:id', to: 'galleries#destroy'
  

  # visits routes
  get 'visits', to: 'visits#index'
  get 'visits/:id', to: 'visits#show'
  post 'visits', to: 'visits#create'
  patch 'visits/:id', to: 'visits#update'
  post 'visits/search', to: 'visits#search'
  delete 'visits/:id', to: 'visits#destroy'

  get 'arts/:id', to: 'arts#images'

  # Defines the root path route ("/")
  # root "articles#index"

  #login and logout
  # post '/login', to: 'sessions#create', as: 'login'
  # get '/auto_login', to: 'sessions#auto_login'
  
  #register
  # post '/register', to: 'sessions#create'
  post '/login', to: 'sessions#login'
  post '/register', to: 'viewers#register'
  get '/session', to: 'sessions#show'
  delete '/logout', to: 'sessions#destroy'

  #viewerprofile
  # get '/viewer_profile/:id', to: 'viewers#show', as: 'viewer_profile'


  #fetch arts 
  get '/arts', to: 'arts#index'
  get '/arts/:id', to: 'arts#show'
  get '/arts/:image_id', to: 'arts#images'
  get '/arts/exhibitions', to: 'arts#exhibitions'
  get '/arts/:id/details', to: 'arts#show'
  get '/arts/search', to: 'arts#search'
  # get '/:id/is_on_view', to: 'arts#is_on_view'
  # post '/search_arts', to: 'arts#search_arts'

  # get '/arts/:id/like', to: 'art#like'

  post '/art_likes/:id', to: 'art_likes#create'
  

  
  



end

