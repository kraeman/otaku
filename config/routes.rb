Rails.application.routes.draw do
  get "/", to: "users#show", as: 'root'
  get 'searches/results', as: 'searches'
  resources :actors
  resources :viewings
  resources :users, except: [:create]
  resources :comments
  resources :shows do
    resources :characters, only: [:show, :index, :new, :create]
  end
  resources :characters
  post '/users', to: "users#create", as: "signup"

  get '/login', to: "sessions#new", as: "signin"
  post '/login', to: "sessions#create"
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/logout', to: "sessions#destroy", as: "logout"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
