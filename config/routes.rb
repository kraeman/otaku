Rails.application.routes.draw do
  resources :actors
  resources :characters
  resources :viewings
  resources :users
  resources :comments
  resources :shows
  get '/login', to: "sessions#new", as: "signin"
  post '/login', to: "sessions#create"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
