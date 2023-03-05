# mount MiradorRails::Engine, at: MiradorRails::Engine.locales_mount_path

Rails.application.routes.draw do
  resources :arts, only: [:index, :show] do
    resources :likes
  end
  #viewers routes
  post '/viewers', to: 'viewers#create'
  patch '/viewers/:id/edit', to: 'viewers#update'
  delete '/viewers/:id/delete', to: 'viewers#destroy'
  get '/viewer_profile', to: 'viewers#profile'
  
  # galleries routes
  get 'galleries', to: 'galleries#index'
  get 'galleries/:id', to: 'galleries#show'
  get 'galleries/:id/arts', to: 'galleries#arts'
  post 'galleries/new', to: 'galleries#create'
  patch 'gallery/:id/edit', to: 'galleries#update'
  delete 'galleries/:id/destroy', to: 'galleries#destroy'
  post 'galleries/search', to: 'galleries#search'
  

  # visits routes
  get 'visits', to: 'visits#index'
  get 'visits/:id', to: 'visits#show'
  post 'visits/new', to: 'visits#create'
  patch 'visits/:id', to: 'visits#update'
  post 'visits/search', to: 'visits#search'

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
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  #viewerprofile
  # get '/viewer_profile/:id', to: 'viewers#show', as: 'viewer_profile'


  #fetch arts 
  # get 'arts', to: 'arts#index'
  # get 'arts/:id', to: 'arts#show'
  get 'arts/:image_id/images', to: 'arts#images'
  get 'arts/exhibitions', to: 'arts#exhibitions'
  # get 'arts/:id/details', to: 'arts#show'
  get 'arts/search', to: 'arts#search'
  # get '/:id/is_on_view', to: 'arts#is_on_view'
  # post '/search_arts', to: 'arts#search_arts'

  
  



end

