Rails.application.routes.draw do
  resources :arts, only: [:inspect]
  resources :visits
  resources :viewers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #login and logout
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  #fetch arts 
  get '/fetch_arts', to: 'application#fetch_arts'
  post '/search_arts', to: 'application#search_arts'
end
