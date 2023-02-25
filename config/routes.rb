Rails.application.routes.draw do
  # resources :galleries
  # resources :arts
  # resources :visits
  # resources :viewers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #login and logout
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  #sigup
  post '/register', to: 'sessions#create', as: 'register'
  post '/register', to: 'viewers#create'


  #fetch arts 
  get '/fetch_arts', to: 'application#fetch_arts'
  post '/search_arts', to: 'application#search_arts'

  #get gallery 
  get '/galleries', to: 'galleries#index'
  get '/galleries/:id', to: 'galleries#show'
  post '/new_gallery', to: 'galleries#new_gallery'
  post '/edit_gallery', to: 'galleries#edit_gallery'
  post '/delete_gallery', to: 'galleries#delete_gallery'
end
