Rails.application.routes.draw do
  resources :actors
  resources :characters
  resources :viewings, except: [:index]
  resources :users, except: [:create, :show]
  resources :comments
  resources :shows
  get '/login', to: "sessions#new", as: "signin"
  post '/login', to: "sessions#create"
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/logout', to: "sessions#destroy", as: "logout"
  #why doesnt the resources above take care of this????
  post '/users/new', to: 'users#create'
  get '/viewings/new', to: 'viewings#new'
  post '/viewings', to: 'viewings#create'
  get '/users/:id', to: 'users#show'
  



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
