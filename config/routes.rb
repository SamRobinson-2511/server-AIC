Rails.application.routes.draw do
  resources :visits
  resources :reviews
  resources :galleries
  resources :arts
  resources :viewers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
